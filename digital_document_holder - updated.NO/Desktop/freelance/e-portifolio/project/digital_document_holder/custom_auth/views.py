from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib import messages
from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.contrib.auth.decorators import login_required
from .models import Users, PasswordResets
from custom_admin.models import Departments, Programs
import uuid
from .utils import send_email_in_thread
def register(request):
    if request.method == "POST":
        try:
            print(request.POST)
            email = request.POST["email"]
            password = request.POST["password"]
            registration_number = request.POST.get("regnumber")
            first_name = request.POST["firstname"]
            last_name = request.POST["lastname"]
            username = email.split("@")[0]
            department_id = request.POST["department_id"]
            department = Departments.objects.get(id=department_id)
            role = request.POST["role"]
            program = request.POST.get("program")
            year = request.POST.get("year")

            # Create user
            user = Users.objects.create_user(
                email=email,
                first_name=first_name,
                last_name=last_name,
                registration_number=registration_number,
                password=password,
                role=role,
                username=username,
                department=department,
                program=program,
                year=year,
            )
            user.save()
            messages.success(request, "Registration successful.")
            return redirect("login")

        except Exception as e:
            messages.error(request, str(e))

            return redirect("register")
    else:
        departments = Departments.objects.all()
        return render(request, "register.html", context={"departments": departments})


def get_programs(request, department_id):
    programs = Programs.objects.filter(department_id=department_id)
    return JsonResponse(
        {"programs": [{"id": program.id, "name": program.name} for program in programs]}
    )


def login(request):
    if request.method == "POST":
        username = request.POST["identifier"]
        password = request.POST["password"]
        user = authenticate(username=username, password=password)
        if user:
            user_login(request, user)
            if user.is_student:
                return redirect("student")
            elif user.is_hod:
                return redirect("hod")
            elif user.is_admin:
                ...
            elif user.is_teacher:
                return redirect("teacher")
        else:
            messages.error(request, "Email or regnumer and password are incorrect")
            return redirect("login")

    return render(request, "login.html")


def forget_password(request):
    if request.method == "POST":
        user_email = request.POST["email"]
        user = Users.objects.get(email=user_email)
        token = uuid.uuid4()
        password_reset = PasswordResets()
        password_reset.user = user
        password_reset.token = token
        password_reset.save()
        reset_link = request.build_absolute_uri().replace(
            "forget_password", "reset_password"
        ) + str(token)
        send_email_in_thread(user.email, reset_link)
        messages.info(request, "Password reset email sent")
        return redirect("forget_password")
    else:
        return render(request, "forgot_password.html")


def reset_password(request, token):
    try:
        token = PasswordResets.objects.get(token=token)
        if token.is_expired():
            messages.error(request, "Your token has expired")
            return redirect("login")
        return render(request, "reset_password.html", context={"token": token.token})
    except PasswordResets.DoesNotExist:
        messages.info(request, "Invalid token")
        return redirect("forget_password")


def set_new_password(request):
    if request.method == "POST":
        token = request.POST["token"]
        new_password = request.POST["new_password"]
        token = PasswordResets.objects.get(token=token)
        if not token.is_expired():
            user = token.user
            user.set_password(new_password)
            user.save()
            token.delete()
            messages.success(request, "Your password updated successfully")
            return redirect("login")
        else:
            messages.error(request, "Your password rest token has expired")
            return redirect("login")

    return render(request, "reset_password.html", context={"token": token})


@login_required
def logout(request):
    user_logout(request)
    messages.info(request, "Logged out")
    return redirect("login")
