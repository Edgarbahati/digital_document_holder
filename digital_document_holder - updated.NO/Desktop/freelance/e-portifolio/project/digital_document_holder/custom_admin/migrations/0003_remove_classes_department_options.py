# Generated by Django 5.1.1 on 2024-09-10 12:31

import django.db.models.deletion
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("custom_admin", "0002_alter_departments_id"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="classes",
            name="department",
        ),
        migrations.CreateModel(
            name="Options",
            fields=[
                (
                    "id",
                    models.CharField(
                        default=uuid.uuid4,
                        max_length=64,
                        primary_key=True,
                        serialize=False,
                        unique=True,
                    ),
                ),
                ("name", models.CharField(max_length=50)),
                (
                    "department",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.DO_NOTHING,
                        to="custom_admin.departments",
                    ),
                ),
            ],
        ),
    ]
