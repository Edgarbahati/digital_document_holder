from django.db import models
import uuid


class Departments(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, unique=True, max_length=64
    )
    name = models.CharField(unique=True, max_length=100)

    def __str__(self) -> str:
        return self.name


# Create your models here.
class Programs(models.Model):
    id = models.CharField(
        primary_key=True, unique=True, default=uuid.uuid4, max_length=64
    )
    department = models.ForeignKey(Departments, models.DO_NOTHING, null=True)
    name = models.CharField(max_length=50)

    def __str__(self) -> str:
        return self.name
