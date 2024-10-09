from django.db import models
from custom_auth.models import Students, Users, Teachers
from hod.models import Modules


# Create your models here.
class Documents(models.Model):
    student = models.ForeignKey(Students, on_delete=models.DO_NOTHING, null=True)
    file = models.FileField(upload_to="", null=True)
    uploaded_at = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=8, blank=True, default="pending")
    module = models.ForeignKey(
        Modules, on_delete=models.DO_NOTHING, blank=True, null=True
    )

    def __str__(self) -> str:
        return f"{self.file}"


class StudentLogs(models.Model):
    student = models.ForeignKey(Students, on_delete=models.DO_NOTHING, null=True)
    activity = models.CharField(max_length=255, null=False)
    datetime = models.DateTimeField(auto_now_add=True)

    def __str__(self) -> str:
        return self.activity


class StudentMessages(models.Model):
    student = models.ForeignKey(Students, on_delete=models.CASCADE, null=True)
    sender = models.ForeignKey(Users, on_delete=models.DO_NOTHING, null=False)
    message = models.CharField(max_length=255, null=False, blank=False)
    datetime = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=64, default="unread")

    def __str__(self) -> str:
        return self.message
