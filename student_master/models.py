from django.db import models
from django.utils.timezone import now
from datetime import datetime
from django.core.exceptions import ValidationError
# Domain Model: Represents a broad academic area
class Domain(models.Model):
    name = models.CharField(max_length=100, unique=True)
    name_en = models.CharField(max_length=100, unique=True, null=True, blank=True)

    def __str__(self):
        return self.name


# Filière Model: Represents a specific track within a domain
class Filiere(models.Model):
    name = models.CharField(max_length=100, unique=True)
    name_en = models.CharField(max_length=100, unique=True, null=True, blank=True)
    domain = models.ForeignKey(Domain, on_delete=models.CASCADE, related_name='filieres')

    def __str__(self):
        return f"{self.name} ({self.domain.name})"


# Speciality Model: Represents a more focused area within a Filière
class Speciality(models.Model):
    name = models.CharField(max_length=100, unique=True)
    name_en = models.CharField(max_length=100, unique=True, null=True, blank=True)
    filiere = models.ForeignKey(Filiere, on_delete=models.CASCADE, related_name='specialities')

    def __str__(self):
        return f"{self.name} ({self.filiere.name})"

# Academic Year Model: Represents the academic year of a student
class PedagogicYear(models.Model):
    # Year of study choices
    YEAR_CHOICES = [
        ('الأولى', 'الأولى'),  # First Year
        ('الثانية', 'الثانية'),  # Second Year
    ]
    # Contract choices
    CONTRAT_CHOICES = [
        ('الأول', 'الأول'),  # First Contract
        ('الثاني', 'الثاني'),  # Second Contract
         ('الثالث', 'الثالث'),  # First Contract
        ('الرابع', 'الرابع'),  # Second Contract
    ]

    # Fields
    year_name = models.CharField(max_length=20, choices=YEAR_CHOICES)
    contrat = models.CharField(max_length=20, choices=CONTRAT_CHOICES)

    def __str__(self):
        return f"{self.year_name} ( السداسي {self.contrat})"


# Subject Model: Represents subjects that are studied within a Speciality
class Unity(models.Model):
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=20)
    speciality = models.ForeignKey(Speciality, on_delete=models.CASCADE, related_name='unities')
    pedagogic_year = models.ForeignKey(PedagogicYear, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.code} - {self.name} - ({self.speciality})"



# Subject Model: Represents subjects that are studied within a Speciality
class Subject(models.Model):
    name = models.CharField(max_length=100)
    credit = models.IntegerField(default=0)
    coeficient = models.IntegerField(default=1)
    unity = models.ForeignKey(Unity, on_delete=models.CASCADE, related_name='subjects')

    def __str__(self):
        return f"{self.name} -({self.unity})"
    




# Student Model: Represents a student and their enrollment details
class Student(models.Model):    
    first_name = models.CharField(max_length=100)
    first_name_en = models.CharField(max_length=100, null=True, blank=True, default='')
    last_name = models.CharField(max_length=100)
    last_name_en = models.CharField(max_length=100, null=True, blank=True, default='')
    birth_day = models.DateField(null=True, blank=True)
    birth_place = models.CharField(max_length=100, null=True, blank=True)
    birth_place_en = models.CharField(max_length=100, null=True, blank=True)
    birth_wilaya = models.CharField(max_length=100, null=True, blank=True)
    birth_wilaya_en = models.CharField(max_length=100, null=True, blank=True)
    email = models.EmailField(max_length=100, null=True, blank=True)
    ex_entreprise = models.CharField(max_length=150, null=True, blank=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name} {self.birth_day}"

# Student Model: Represents a student and their enrollment details
class StudentContrat(models.Model): 
     # Helper function to generate academic year choices
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year  # Default end year to next year
        return [
            (f"{year + 1 }/{year}", f"{year + 1}/{year}")
            for year in range(end_year, start_year, -1)
        ]
     # Contract choices
    BRANCH_CHOICES = [
        ('رياضيات', 'رياضيات'),  # First Contract
        ('فيزياء', 'فيزياء'),  # Second Contract
        ('إعلام ألي', 'إعلام ألي'),  # First Contract
        ('علوم طبيعية', 'علوم طبيعية'),
        ('موسيقى', 'موسيقى'),  # Second Contract
    ]  
    CATEGORY_CHOICES = [
        ('أستاذ التعليم المتوسط', 'أستاذ التعليم المتوسط'),  # First Contract
        ('أستاذ التعليم الثانوي', 'أستاذ التعليم الثانوي'),
    ]
    SEXE_CHOICES = [
        ('ذكر', 'ذكر'),  # First Contract
        ('أنثى', 'أنثى'),
    ]            
    first_name = models.CharField(max_length=100)
    first_name_en = models.CharField(max_length=100, null=True, blank=True, default='')
    last_name = models.CharField(max_length=100)
    last_name_en = models.CharField(max_length=100, null=True, blank=True, default='')
    birth_day = models.DateField(null=True, blank=True)
    birth_place = models.CharField(max_length=100, null=True, blank=True)
    birth_place_en = models.CharField(max_length=100, null=True, blank=True)
    birth_wilaya = models.CharField(max_length=100, null=True, blank=True)
    birth_wilaya_en = models.CharField(max_length=100, null=True, blank=True)
    address = models.CharField(max_length=100, null=True, blank=True)
    live_wilaya = models.CharField(max_length=100, null=True, blank=True)
    email = models.EmailField(max_length=100, null=True, blank=True)
    branch = models.CharField(max_length=50, choices=BRANCH_CHOICES, default='')
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES, default='')
    sexe = models.CharField(max_length=50, choices=SEXE_CHOICES, default='')
    academic_year = models.CharField(
       max_length=9, 
       choices=academic_year_choices(2000),  # Generate choices dynamically
       default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )
    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class Decrit(models.Model):
     # Helper function to generate academic year choices
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year  # Default end year to next year
        return [
            (f"{year + 1 }/{year}", f"{year + 1}/{year}")
            for year in range(end_year, start_year, -1)
        ]
    title = models.CharField(max_length=100)
    academic_year = models.CharField(
       max_length=9, 
       choices=academic_year_choices(2000),  # Generate choices dynamically
       default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )

# Enrollment Model: Represents a student's enrollment in a specific subject
class Enrollment(models.Model):
    # Helper function to generate academic year choices
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year  # Default end year to next year
        return [
            (f"{year + 1 }/{year}", f"{year + 1}/{year}")
            for year in range(end_year, start_year, -1)
        ]

    # Foreign Key relations
    matricule = models.CharField(max_length=50, default='')
    student = models.ForeignKey('Student', on_delete=models.CASCADE, related_name='enrollments')
    speciality = models.ForeignKey('Speciality', on_delete=models.CASCADE, related_name='enrollments')
    pedagogic_year = models.ForeignKey(PedagogicYear, on_delete=models.CASCADE, related_name='enrollments')
    
    # Enrollment Details
    date_enrolled = models.DateField(auto_now_add=True)
    academic_year = models.CharField(
        max_length=9, 
        choices=academic_year_choices(2000),  # Generate choices dynamically
        default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )
    badge_issued = models.BooleanField(default=False)  # Whether the transcript has been issued
    issued_badge_date = models.DateField(null=True, blank=True)
    certificate_issued = models.BooleanField(default=False)  # Whether the certificate has been issued
    issued_certificate_date = models.DateField(null=True, blank=True)
    def __str__(self):
        return f"{self.student} enrolled in {self.speciality} for {self.pedagogic_year.year_name} ({self.academic_year})"


from django.utils.timezone import now

# Deliberation Model: Represents a student's academic deliberation
class Deliberation(models.Model):
    # Helper function to generate academic year choices
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year + 1  # Default end year to next year
        return [
            (f"{year}/{year - 1}", f"{year}/{year - 1}")
            for year in range(end_year, start_year, -1)
        ]
    # Foreign Key relations
    student = models.ForeignKey(
        'Student', 
        on_delete=models.CASCADE, 
        related_name='deliberation_students'
    )
    pedagogic_year = models.ForeignKey(PedagogicYear, on_delete=models.CASCADE, related_name='deliberations', default='الثانية')
    speciality = models.ForeignKey(
        'Speciality', 
        on_delete=models.CASCADE, 
        related_name='deliberation_specialities'
    )
    
    # Academic information
    total_credits = models.IntegerField(default=0)  # Total credits earned
    average_grade = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)  # Student's average grade
    result_status = models.CharField(
        max_length=20,
        choices=[
            ('ناجح', 'ناجح'),
            ('معيد', 'معيد'),
            ('منقطع', 'منقطع'),  # High achievement
        ],
        default='ناجح'
    )
    decision_date = models.DateField(default=now)  # Date of deliberation decision
    academic_year = models.CharField(
        max_length=9, 
        choices=academic_year_choices(2000),  # Generate choices dynamically
        default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )
    mention = models.CharField(
        max_length=20,
        choices=[
            ('/', '/'),
            ('مقبول', 'مقبول'),
            ('قريب من الجيد', 'قريب من الجيد'),
            ('جيد', 'جيد'), 
            ('جيد جدا', 'جيد جدا'), 
            ('ممتاز', 'ممتاز'),  
        ],
        default='/'
    )
    diploma_number = models.IntegerField(default=0)
    # Diploma information
    diploma_issued = models.BooleanField(default=False)  # Whether the diploma has been issued
    transcript_issued = models.BooleanField(default=False)  # Whether the transcript has been issued
    issued_date = models.DateField(null=True, blank=True)
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['student', 'pedagogic_year'], name='unique_student_pedagogic_year_deliberation')
        ]
    def clean(self):
        # Ensure that diploma_number is unique if it is not 0
        if self.diploma_number != 0:
            if Deliberation.objects.exclude(pk=self.pk).filter(diploma_number=self.diploma_number).exists():
                raise ValidationError({'diploma_number': 'رقم الشهادة هذا قيد الاستخدام بالفعل.'})


    def __str__(self):
        return f"{self.student.first_name} {self.student.last_name} - {self.speciality.name}"


# Grade Model: To store grades for each subject
class Grade(models.Model):
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year  # Default end year to next year
        return [
            (f"{year + 1 }/{year}", f"{year + 1}/{year}")
            for year in range(end_year, start_year, -1)
        ]

    # Foreign Key relations
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='grades')
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE, related_name='grades')
    pedagogic_year = models.ForeignKey(PedagogicYear, on_delete=models.CASCADE, related_name='grades')
    
    # Grade information
    grade = models.DecimalField(max_digits=5, decimal_places=2)  # Grade out of 20
    session = models.CharField(
        max_length=20,
        choices=[
            ('العادية', 'العادية'),  # Regular session
            ('الثانية', 'الثانية'),  # Remedial session
        ],
        default='العادية'
    )
    academic_year = models.CharField(
        max_length=9, 
        choices=academic_year_choices(2000),  # Generate choices dynamically
        default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )
    def __str__(self):
        return f"{self.student}: {self.subject.name} - {self.grade}/20 ({self.session})"

import os
# File Upload Path Function
def memoire_file_upload_path(instance, filename):
    speciality_name = f"{instance.speciality}".replace(' ', '_')
    academic_year = instance.academic_year.replace('/', '_') if instance.academic_year else 'unknown'

    # Get the file extension
    ext = filename.split('.')[-1]
    
    # Create the new filename with the student's info
    new_filename = f"{instance.student.first_name}_{instance.student.last_name}_{instance.student.birth_day}.{ext}"
    
    # Construct the full upload path
    return os.path.join(f'{academic_year}/{speciality_name}', new_filename)

# Memoire Model
class Memoire(models.Model):
    
    @staticmethod
    def academic_year_choices(start_year=2000, end_year=None):
        """Generate academic year choices like 2025/2024."""
        if end_year is None:
            end_year = datetime.now().year  # Default to the current year
        return [
            (f"{year + 1}/{year}", f"{year + 1}/{year}")
            for year in range(end_year, start_year, -1)
        ]

    # Foreign Key relations
    speciality = models.ForeignKey(
        Speciality, 
        on_delete=models.CASCADE, 
        related_name='memoire_specialities'
    )
    student = models.ForeignKey(
        Student, 
        on_delete=models.CASCADE, 
        related_name='memoire_students'
    )
    
    coeficient = models.IntegerField(default=1)
    credit = models.IntegerField(default=0)  # Total credits earned
    grade = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)  # Student's average grade
    
    session = models.CharField(
        max_length=20,
        choices=[
            ('العادية', 'العادية'),  # Regular session
            ('الثانية', 'الثانية'),  # Remedial session
        ],
        default='العادية'
    )
    
    academic_year = models.CharField(
        max_length=9, 
        choices=academic_year_choices(2000),  # Generate choices dynamically
        default=f"{datetime.now().year}/{datetime.now().year - 1}"
    )
    
    memoire_file = models.FileField(upload_to=memoire_file_upload_path, null=True, blank=True)

    def __str__(self):
        return f"{self.student.first_name} {self.student.last_name} - {self.speciality.name}"
