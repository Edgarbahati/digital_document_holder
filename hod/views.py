from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .utils import has_permission, send_message
from .models import Modules, Programs
from custom_admin.models import Programs
from custom_auth.models import Students
from student.models import Documents, StudentMessages
from custom_auth.models import Users, Teachers


@login_required
@has_permission
def index(request): ...
@login_required
@has_permission
def dashboard(request):
    students = Students.objects.filter(user__department=request.user.department).count()
    documents = Documents.objects.filter(
        module__department=request.user.department
    ).count()
    modules = Modules.objects.filter(department=request.user.department).count()
    teachers = Teachers.objects.filter(user__department=request.user.department).count()
    programs = Programs.objects.filter(department=request.user.department)
    return render(
        request,
        "hod_dashboard.html",
        context={
            "students": students,
            "documents": documents,
            "modules": modules,
            "teachers": teachers,
            "programs": programs,
        },
    )


@login_required
@has_permission
def profile(request):
    return render(request, "hod_profile.html")


@login_required
@has_permission
def upload(request):
    modules = Modules.objects.filter(program__department=request.user.department)
    teachers = Teachers.objects.filter(user__department=request.user.department)
    programs = Programs.objects.filter(department=request.user.department)
    if request.method == "POST":
        title = request.POST["title"]
        learning_hours = request.POST["hours"]
        teacher = request.POST["teacher"]
        teacher = Teachers.objects.get(id=teacher)
        program = request.POST["program"]
        program = Programs.objects.get(id=program)
        year = request.POST["year"]
        # instantiate new module
        module = Modules()
        module.title = title
        module.learning_hours = learning_hours
        module.teacher = teacher
        module.program = program
        module.department = request.user.department
        module.year = year
        module.save()
        return redirect("hod_upload")

    return render(
        request,
        "hod_courses.html",
        context={"modules": modules, "teachers": teachers, "programs": programs},
    )


@login_required
@has_permission
def folders(request):
    programs = Programs.objects.filter(department=request.user.department)
    print(programs)
    return render(request, "hod_folders.html", context={"programs": programs})


@login_required
@has_permission
def announcements(request):
    return render(request, "hod_announcement.html")


@login_required
@has_permission
def hod_settings(request):
    return render(request, "hod_settings.html")


@login_required
@has_permission
def year_modules(request, program_id, year):
    modules = Modules.objects.filter(program_id=program_id, year=year)
    return render(request, "hod_modules.html", context={"modules": modules})


@login_required
@has_permission
def module_students(request, module_id):
    module = Modules.objects.get(id=module_id)
    # documents = Documents.objects.filter(module=module)
    students = Students.objects.filter(
        year=module.year,
        program=module.program,
    )

    return render(
        request,
        "hod_students.html",
        context={"students": students, "module": module},
    )


@login_required
@has_permission
def module_documents(request, module_id, student_id):
    module = Modules.objects.get(id=module_id)
    student = Students.objects.get(id=student_id)
    documents = Documents.objects.filter(module=module, student=student)
    send_message(student.user.id, "Hod is viewing your documents")
    return render(
        request,
        "hod_student_documents.html",
        context={"module": module, "student": student, "documents": documents},
    )


@login_required
@has_permission
def change_document_status(request, document_id, new_status):
    document = Documents.objects.get(id=document_id)
    student = document.student
    module = document.module
    document.status = new_status
    document.save()
    # send message to student in realtime
    send_message(
        student.user.id, f"Hod '{request.user.first_name}' {new_status} your document."
    )
    # save student message to db
    message = StudentMessages()
    message.sender = request.user
    message.student = student
    message.message = f'your document <a href="{document.file.url}">{document.file.name}</a> has {new_status} by {request.user.first_name}.'
    message.save()
    return redirect("hod_student_documents", module_id=module.id, student_id=student.id)


@login_required
@has_permission
def delete_document(request, document_id):
    document = Documents.objects.get(id=document_id)
    student = document.student
    module = document.module
    document.delete()
    # send message to student in realtime
    send_message(
        student.user.id, f"Hod '{request.user.first_name}' deleted your document."
    )
    # send message to student
    message = StudentMessages()
    message.sender = request.user
    message.student = student
    message.message = (
        f"your document {document.file.url} has  deleted by {request.user.first_name}."
    )
    message.save()
    return redirect("hod_student_documents", module_id=module.id, student_id=student.id)
