# Generated by Django 5.1.1 on 2024-09-17 16:36

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("custom_auth", "0016_alter_passwordresets_expired_at"),
    ]

    operations = [
        migrations.AlterField(
            model_name="passwordresets",
            name="expired_at",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2024, 9, 17, 17, 36, 4, 841752, tzinfo=datetime.timezone.utc
                )
            ),
        ),
    ]
