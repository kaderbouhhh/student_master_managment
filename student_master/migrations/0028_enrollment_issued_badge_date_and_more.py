# Generated by Django 5.1.1 on 2025-02-18 08:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student_master', '0027_deliberation_issued_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='enrollment',
            name='issued_badge_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='enrollment',
            name='issued_certificate_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='enrollment',
            name='transcript_issued',
            field=models.BooleanField(default=False),
        ),
    ]
