from django.contrib import admin
from .models import Domain, Filiere, Speciality, Unity, Subject, Student, PedagogicYear, Enrollment, Deliberation, Grade


@admin.register(Domain)
class DomainAdmin(admin.ModelAdmin):
    list_display = ('name',)


@admin.register(Filiere)
class FiliereAdmin(admin.ModelAdmin):
    list_display = ('name', 'domain')  # Display related domain


@admin.register(Speciality)
class SpecialityAdmin(admin.ModelAdmin):
    list_display = ('name', 'filiere')  # Display related filiere


@admin.register(Unity)
class UnityAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'speciality')  # Display unity and related speciality


@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ('name', 'credit', 'coeficient', 'unity', 'unity__speciality')  # Include credit, coefficient, and unity
    list_filter = ('unity',)  # Add a filter for unity


@admin.register(PedagogicYear)
class PedagogicYearAdmin(admin.ModelAdmin):
    list_display = ('year_name',)


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'birth_day', 'email')
    search_fields = ('first_name', 'last_name', 'email')
    list_filter = ('first_name', 'last_name', 'birth_day')  # Filters for easier navigation

    @admin.display(description="Department")  # Add description for admin display
    def get_department(self, obj):
        return obj.speciality.filiere.domain.name  # Derive department from the related speciality


@admin.register(Enrollment)
class EnrollmentAdmin(admin.ModelAdmin):
    list_display = ('matricule', 'student', 'speciality', 'date_enrolled', 'academic_year')
    list_filter = ('speciality', 'academic_year')  # Add filters for speciality and academic year


@admin.register(Deliberation)
class DeliberationAdmin(admin.ModelAdmin):
    list_display = ('student', 'speciality', 'academic_year')


   