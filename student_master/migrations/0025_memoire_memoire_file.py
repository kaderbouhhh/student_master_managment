# Generated by Django 5.1.1 on 2025-02-06 09:33

import student_master.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student_master', '0024_decrit_student_contrat_academic_year'),
    ]

    operations = [
        migrations.AddField(
            model_name='memoire',
            name='memoire_file',
            field=models.ImageField(blank=True, null=True, upload_to=student_master.models.memoire_file_upload_path),
        ),
    ]
