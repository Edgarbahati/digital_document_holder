from django.db import models
import uuid
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone
from custom_admin.models import Departments, Programs
from datetime import timedelta


class UserManager(BaseUserManager):
    def create_user(
        self,
        email,
        first_name,
        last_name,
        username,
        password=None,
        department=None,
        role=None,
        registration_number=None,
        year=None,
        program=None,
    ):
        if not email:
            raise ValueError("Users must have an email address")
        if role == "student" and not registration_number:
            raise ValueError("Registration number is required")
        if role == "student":
            user = self.model(
                email=self.normalize_email(email),
                username=username,
                first_name=first_name,
                last_name=last_name,
                registration_number=f"{registration_number}".lower().replace(" ", ""),
                department=department,
            )
            user.set_password(password)
            user.is_student = True
            user.save(using=self._db)
            student_program = Programs.objects.get(id=program)
            student = Students.objects.create(
                user=user, year=year, program=student_program
            )
            student.save()
            return user
        elif role == "teacher":
            user = self.model(
                email=self.normalize_email(email),
                username=username,
                first_name=first_name,
                last_name=last_name,
                department=department,
            )
            user.set_password(password)
            user.is_teacher = True
            user.save(using=self._db)
            teacher = Teachers.objects.create(user=user)
            teacher.save()
            return user
        elif role == "hod":
            user = self.model(
                email=self.normalize_email(email),
                username=username,
                first_name=first_name,
                last_name=last_name,
                department=department,
            )
            user.set_password(password)
            user.is_hod = True
            user.save(using=self._db)
            hod = Hods.objects.create(user=user)
            hod.save()
            return user

    def create_superuser(
        self, email, first_name, last_name, username, password=None, **extra_fields
    ):
        user = self.create_user(
            email=email,
            username=username,
            password=password,
            first_name=first_name,
            last_name=last_name,
        )
        user.is_admin = True
        user.is_student = False
        user.is_hod = False
        user.is_teacher = False
        user.is_active = True
        user.is_superadmin = True
        user.is_staff = True
        user.save(using=self._db)
        return user


class Users(AbstractBaseUser):
    id = models.CharField(primary_key=True, default=uuid.uuid4, max_length=64)
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    username = models.CharField(max_length=50, unique=True)
    department = models.ForeignKey(Departments, on_delete=models.DO_NOTHING, null=True)
    registration_number = models.CharField(max_length=20, unique=True, null=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now=True)
    is_student = models.BooleanField(default=False)
    is_teacher = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_hod = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superadmin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username", "first_name", "last_name", "registration_number"]

    objects = UserManager()

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True


class Teachers(models.Model):
    user = models.OneToOneField(Users, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.email


class Students(models.Model):
    user = models.OneToOneField(Users, on_delete=models.CASCADE)
    year = models.IntegerField(null=True)
    program = models.ForeignKey(
        Programs, on_delete=models.DO_NOTHING, null=True, blank=True
    )

    def __str__(self):
        return self.user.email


class Hods(models.Model):
    user = models.OneToOneField(Users, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.email


class PasswordResets(models.Model):
    id = models.CharField(
        primary_key=True, unique=True, default=uuid.uuid4, max_length=64
    )
    user = models.ForeignKey(Users, on_delete=models.DO_NOTHING, blank=True, null=True)
    token = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now=True)
    expired_at = models.DateTimeField(default=timezone.now() + timedelta(hours=1))

    def is_expired(self):
        return timezone.now() > self.expired_at
