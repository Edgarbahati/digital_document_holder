from django.db import models
from custom_admin.models import Departments, Programs
from custom_auth.models import Teachers
import uuid


# Create your models here.
class Modules(models.Model):
    id = models.CharField(
        primary_key=True, unique=True, default=uuid.uuid4, max_length=64
    )
    title = models.CharField(max_length=255)
    learning_hours = models.IntegerField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    teacher = models.ForeignKey(Teachers, on_delete=models.DO_NOTHING, null=True)
    department = models.ForeignKey(Departments, on_delete=models.DO_NOTHING, null=True)
    year = models.CharField(max_length=1, null=True, blank=True)
    program = models.ForeignKey(
        Programs, on_delete=models.DO_NOTHING, null=True, blank=True
    )

    class Meta:
        managed = True
        db_table = "modules"

    def __str__(self):
        return self.title
