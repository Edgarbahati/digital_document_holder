# Generated by Django 5.1.1 on 2024-09-14 06:11

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("custom_auth", "0007_alter_passwordresets_expired_at"),
    ]

    operations = [
        migrations.AlterField(
            model_name="passwordresets",
            name="expired_at",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2024, 9, 14, 7, 11, 20, 178814, tzinfo=datetime.timezone.utc
                )
            ),
        ),
    ]