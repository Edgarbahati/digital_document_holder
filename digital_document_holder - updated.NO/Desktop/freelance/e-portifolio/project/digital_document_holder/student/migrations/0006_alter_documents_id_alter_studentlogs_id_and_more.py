# Generated by Django 5.1.1 on 2024-09-14 19:54

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("student", "0005_rename_studentlog_studentlogs_studentmessages"),
    ]

    operations = [
        migrations.AlterField(
            model_name="documents",
            name="id",
            field=models.CharField(
                default=uuid.uuid4, max_length=64, primary_key=True, serialize=False
            ),
        ),
        migrations.AlterField(
            model_name="studentlogs",
            name="id",
            field=models.CharField(
                default=uuid.uuid4, max_length=64, primary_key=True, serialize=False
            ),
        ),
        migrations.AlterField(
            model_name="studentmessages",
            name="id",
            field=models.CharField(
                default=uuid.uuid4, max_length=64, primary_key=True, serialize=False
            ),
        ),
    ]
