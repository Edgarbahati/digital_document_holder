from django.db import models
from custom_auth.models import Teachers
from hod.models import Modules
# Create your models here.
class TeacherDocuments(models.Model):
    teacher= models.ForeignKey(Teachers, on_delete=models.DO_NOTHING, null=True)
    file = models.FileField(upload_to="", null=True)
    uploaded_at = models.DateTimeField(auto_now=True)
    module = models.ForeignKey(
        Modules, on_delete=models.DO_NOTHING, blank=True, null=True
    )
    year= models.CharField(max_length=1)

    def __str__(self) -> str:
        return f"{self.file}"