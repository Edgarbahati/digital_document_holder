from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from hod.models import Modules
from custom_auth.models import Students
from student.models import Documents
from django.contrib import messages
from django.db.models import Q
from django.http import JsonResponse
from custom_auth.models import Users
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from .models import StudentLogs, StudentMessages
from django.db.models import Count
import datetime
from django.utils.timezone import now
from .utils import verify_document
from django.conf import settings
import threading
from .utils import has_permission, check_current_password
from django.contrib.auth import update_session_auth_hash


@login_required
@has_permission
def index(request):
    student = Students.objects.get(user=request.user)
    modules = Modules.objects.filter(department=request.user.department).count()
    documents = Documents.objects.filter(student=student).count()
    reviewed = Documents.objects.filter(student=student, status="verified").count()
    return render(
        request,
        "student_dashboard.html",
        context={"modules": modules, "documents": documents, "reviewed": reviewed},
    )


@login_required
@has_permission
def upload_document(request):
    if request.method == "POST":
        module = Modules.objects.get(id=request.POST["module"])
        file = request.FILES["file"]
        reader = settings.EASY_OCR_READER
        student = Students.objects.get(user=request.user)
        document = Documents.objects.create(student=student, module=module, file=file)
        file = document.file
        threading.Thread(
            target=lambda: verify_document(
                file, reader, student, module, document, request.user
            )
        ).start()
        return JsonResponse({"message": "Your document is being verified ..."})
    else:
        modules = Modules.objects.filter(department=request.user.department)
        return render(request, "upload_document.html", context={"modules": modules})


@login_required
@has_permission
def dashboard(request):
    student = Students.objects.get(user=request.user)
    modules = Modules.objects.filter(department=request.user.department).count()
    documents = Documents.objects.filter(student=student).count()
    reviewed = Documents.objects.filter(student=student, status="verified").count()
    messages = StudentMessages.objects.filter(student=student, status="unread").count()
    activities = StudentLogs.objects.filter(student=student).order_by("-datetime")[:5]
    top_uploads = (
        Modules.objects.filter(documents__student=student)
        .annotate(document_count=Count("documents"))
        .order_by("-document_count")[:5]
    )
    start_of_week = now().date() - datetime.timedelta(days=now().weekday())
    end_of_week = start_of_week + datetime.timedelta(days=6)
    documents_this_week = (
        Documents.objects.filter(
            student=student, uploaded_at__range=[start_of_week, end_of_week]
        )
        .extra(select={"day": "DATE(uploaded_at)"})
        .values("day")
        .annotate(document_count=Count("id"))
        .order_by("day")
    )
    upload_days = [entry["day"].strftime("%A") for entry in documents_this_week]
    upload_counts = [entry["document_count"] for entry in documents_this_week]

    context = {
        "modules": modules,
        "documents": documents,
        "reviewed": reviewed,
        "messages": messages,
        "activities": activities,
        "top_uploads": top_uploads,
        "upload_days": upload_days,
        "upload_counts": upload_counts,
    }
    return render(request, "student_dashboard.html", context=context)


@login_required
@has_permission
def profile(request):
    user = request.user
    if request.method == "POST":
        new_email = request.POST.get("email")
        if Users.objects.exclude(id=user.id).filter(email=new_email).exists():
            messages.error(request, "This email is already taken.")
            return redirect("student_profile")
        user.first_name = request.POST.get("first_name")
        user.last_name = request.POST.get("last_name")
        user.email = new_email
        user.save()
        student = Students.objects.get(user=request.user)
        log = StudentLogs()
        log.student = student
        log.activity = f"Profile updated"
        log.save()
        messages.success(request, "Profile updated successfully.")
        return redirect("student_profile")
    return render(request, "student_profile.html", {"user": user})


@login_required
@has_permission
def documents(request):
    modules = Modules.objects.filter(department=request.user.department)
    return render(request, "student_documents.html", context={"modules": modules})


@login_required
@has_permission
def module_documents(request, module_id):
    student = get_object_or_404(Students, user=request.user)
    module = get_object_or_404(Modules, id=module_id)
    documents = Documents.objects.filter(student=student, module=module)
    if (
        request.headers.get("x-requested-with") == "XMLHttpRequest"
        and request.method == "GET"
    ):
        query = request.GET.get("search", "")
        if query:
            documents = documents.filter(
                Q(file__icontains=query) | Q(status__icontains=query)
            )
        paginator = Paginator(documents, 6)
        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)
        documents_data = [
            {
                "id": document.id,
                "file_name": document.file.name,
                "uploaded_at": document.uploaded_at.strftime("%Y-%m-%d %H:%M"),
                "status": document.status,
                "student": document.student.user.username,
            }
            for document in page_obj
        ]
        return JsonResponse(
            {"documents": documents_data, "has_next": page_obj.has_next()}
        )
    paginator = Paginator(documents, 6)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)

    return render(
        request,
        "student_documents_list.html",
        context={"page_obj": page_obj, "module": module},
    )


@login_required
@has_permission
def student_messages(request):
    student = Students.objects.get(user=request.user)
    messages = StudentMessages.objects.filter(student=student).order_by("-datetime")
    paginator = Paginator(messages, 4)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)
    context = {"page_obj": page_obj}
    return render(request, "student_messages.html", context)


@login_required
@has_permission
def mark_as_read(request, id):
    if request.method == "POST":
        student = Students.objects.get(user=request.user)
        try:
            message = StudentMessages.objects.get(id=id, student=student)
            if message.status == "unread":
                message.status = "read"
                message.save()
            return JsonResponse({"success": True})
        except StudentMessages.DoesNotExist:
            return JsonResponse({"success": False, "error": "Message not found"})
    return JsonResponse({"success": False, "error": "Invalid request method"})


@login_required
@has_permission
def student_settings(request):
    if request.method == "POST":
        try:
            first_name = request.POST["first_name"]
            last_name = request.POST["last_name"]
            email = request.POST["email"]
            current_password = request.POST["current_password"]
            new_password = request.POST["new_password"]

            user = Users.objects.get(email=request.user.email)
            user.first_name = first_name
            user.last_name = last_name
            user.email = email

            # Check if the password needs to be updated
            if current_password and new_password:
                current_password_valid = check_current_password(
                    request.user.email, current_password
                )

                if current_password_valid:
                    user.set_password(new_password)
                    user.save()

                    # Update the session to prevent logout
                    update_session_auth_hash(request, user)

                    messages.success(
                        request, "Your password has been changed successfully."
                    )
                else:
                    messages.warning(
                        request,
                        "Your password hasn't changed due to incorrect current password, but other fields were updated.",
                    )
            else:
                # Save changes if no password change
                user.save()
                messages.success(
                    request, "Your account information has been changed successfully."
                )

            return redirect("student_settings")

        except Exception as e:
            messages.error(request, str(e))
            return redirect("student_settings")

    return render(request, "student_settings.html")
