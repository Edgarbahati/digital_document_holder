# Generated by Django 5.1.1 on 2024-09-17 16:28

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("hod", "0003_rename_deparment_modules_department"),
    ]

    operations = [
        migrations.AddField(
            model_name="modules",
            name="year",
            field=models.CharField(blank=True, max_length=1, null=True),
        ),
    ]
