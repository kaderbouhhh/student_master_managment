# Generated by Django 5.1.1 on 2025-01-12 11:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student_master', '0016_alter_student_birth_day_alter_student_birth_place_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='birth_day',
            field=models.DateField(blank=True, null=True),
        ),
    ]
