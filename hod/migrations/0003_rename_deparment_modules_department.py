# Generated by Django 5.1.1 on 2024-09-10 13:19

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("hod", "0002_rename_uploaded_at_modules_created_at_and_more"),
    ]

    operations = [
        migrations.RenameField(
            model_name="modules",
            old_name="deparment",
            new_name="department",
        ),
    ]
