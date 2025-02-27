# Generated by Django 5.1.1 on 2025-01-20 09:05

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student_master', '0020_alter_student_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='memoire',
            name='academic_year',
            field=models.CharField(choices=[('2026/2025', '2026/2025'), ('2025/2024', '2025/2024'), ('2024/2023', '2024/2023'), ('2023/2022', '2023/2022'), ('2022/2021', '2022/2021'), ('2021/2020', '2021/2020'), ('2020/2019', '2020/2019'), ('2019/2018', '2019/2018'), ('2018/2017', '2018/2017'), ('2017/2016', '2017/2016'), ('2016/2015', '2016/2015'), ('2015/2014', '2015/2014'), ('2014/2013', '2014/2013'), ('2013/2012', '2013/2012'), ('2012/2011', '2012/2011'), ('2011/2010', '2011/2010'), ('2010/2009', '2010/2009'), ('2009/2008', '2009/2008'), ('2008/2007', '2008/2007'), ('2007/2006', '2007/2006'), ('2006/2005', '2006/2005'), ('2005/2004', '2005/2004'), ('2004/2003', '2004/2003'), ('2003/2002', '2003/2002'), ('2002/2001', '2002/2001')], default='2025/2024', max_length=9),
        ),
        migrations.AlterField(
            model_name='deliberation',
            name='pedagogic_year',
            field=models.ForeignKey(default='الثانية', on_delete=django.db.models.deletion.CASCADE, related_name='deliberations', to='student_master.pedagogicyear'),
        ),
    ]
