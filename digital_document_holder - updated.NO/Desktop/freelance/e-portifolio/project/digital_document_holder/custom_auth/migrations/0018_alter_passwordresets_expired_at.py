# Generated by Django 5.1.1 on 2024-09-18 20:46

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("custom_auth", "0017_alter_passwordresets_expired_at"),
    ]

    operations = [
        migrations.AlterField(
            model_name="passwordresets",
            name="expired_at",
            field=models.DateTimeField(
                default=datetime.datetime(
                    2024, 9, 18, 21, 46, 25, 266806, tzinfo=datetime.timezone.utc
                )
            ),
        ),
    ]
