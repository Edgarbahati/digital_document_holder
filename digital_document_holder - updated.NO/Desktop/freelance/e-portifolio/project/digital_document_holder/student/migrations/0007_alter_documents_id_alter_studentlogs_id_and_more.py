# Generated by Django 5.1.1 on 2024-09-14 19:56

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("student", "0006_alter_documents_id_alter_studentlogs_id_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="documents",
            name="id",
            field=models.BigAutoField(
                auto_created=True, primary_key=True, serialize=False, verbose_name="ID"
            ),
        ),
        migrations.AlterField(
            model_name="studentlogs",
            name="id",
            field=models.BigAutoField(
                auto_created=True, primary_key=True, serialize=False, verbose_name="ID"
            ),
        ),
        migrations.AlterField(
            model_name="studentmessages",
            name="id",
            field=models.BigAutoField(
                auto_created=True, primary_key=True, serialize=False, verbose_name="ID"
            ),
        ),
    ]
