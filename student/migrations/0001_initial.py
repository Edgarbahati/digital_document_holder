# Generated by Django 5.1.1 on 2024-09-10 09:34

import django.db.models.deletion
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("hod", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Documents",
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
                ("user_id", models.IntegerField()),
                ("title", models.CharField(max_length=255)),
                ("file_name", models.CharField(max_length=255)),
                ("file_path", models.CharField(max_length=255)),
                ("uploaded_at", models.DateTimeField()),
                ("status", models.CharField(blank=True, max_length=8, null=True)),
                (
                    "subject",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.DO_NOTHING,
                        to="hod.subjects",
                    ),
                ),
            ],
        ),
    ]
