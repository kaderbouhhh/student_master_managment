from django import forms
from .models import Student, Domain, Filiere, Speciality, Unity, Subject, Deliberation, Enrollment, Grade, Memoire, PedagogicYear, StudentContrat


class StudentContratForm(forms.ModelForm):
    class Meta:
        model = StudentContrat
        fields = [
            'first_name', 'first_name_en', 'last_name', 'last_name_en', 'birth_day',
            'birth_place', 'birth_place_en', 'birth_wilaya', 'birth_wilaya_en',
            'address', 'live_wilaya', 'email', 'branch', 'category', 'sexe', 'academic_year'
        ]
        labels = {
            'first_name': 'الاسم',
            'first_name_en': 'الاسم بالحروف اللاتينية',
            'last_name': 'اللقب',
            'last_name_en': 'اللقب بالحروف اللاتينية',
            'birth_day': 'تاريخ الميلاد',
            'birth_place': 'مكان الميلاد',
            'birth_place_en': 'مكان الميلاد بالحروف اللاتينية',
            'birth_wilaya': 'الولاية',
            'birth_wilaya_en': 'Wilaya',
            'address': 'العنوان',
            'live_wilaya': 'ولاية الإقامة',
            'email': 'البريد الإلكتروني',
            'brache': 'التخصص',
            'category': 'الرتبة',
            'sexe': 'الجنس',
            'academic_year': 'السنة الدراسية',
        }
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل الاسم'}),
            'first_name_en': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل الاسم بالحروف اللاتينية'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل اللقب'}),
            'last_name_en': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل اللقب بالحروف اللاتينية'}),
            'birth_day': forms.DateInput(attrs={'class': 'form-control', 'type': 'date', 'placeholder': 'اختر تاريخ الميلاد'}),
            'birth_place': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل مكان الميلاد'}),
            'birth_place_en': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل مكان الميلاد بالحروف اللاتينية'}),
            'birth_wilaya': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل الولاية'}),
            'birth_wilaya_en': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'tapper la wilaya'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل العنوان'}),
            'live_wilaya': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'أدخل ولاية الإقامة'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'أدخل البريد الإلكتروني'}),
            'branch': forms.Select(attrs={'class': 'form-control'}),
            'category': forms.Select(attrs={'class': 'form-control'}),
            'sexe': forms.Select(attrs={'class': 'form-control'}),
            'academic_year': forms.Select(attrs={'class': 'form-control'}),
        }


class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = [
            'first_name', 'first_name_en', 'last_name', 'last_name_en', 'birth_day', 
            'birth_place', 'birth_place_en', 'birth_wilaya', 'birth_wilaya_en', 'email', 'ex_entreprise'
        ]
        labels = {
            'first_name': 'الاسم',
            'last_name': 'اللقب',
            'first_name_en': 'الاسم بالحروف اللاتينية',
            'last_name_en': 'اللقب بالحروف اللاتينية',
            'birth_day': 'تاريخ الميلاد',
            'birth_place': 'مكان الميلاد',
            'birth_place_en': 'مكان الميلاد بالحروف اللاتينية',
            'birth_wilaya': 'الولاية',
            'birth_wilaya_en': 'wilaya',
            'email': 'البريد الإلكتروني',
            'ex_entreprise': 'مؤسسة النكوين السابقة',
        }
        widgets = {            
            'first_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل الاسم ',
            }),
            'last_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل اللقب',
            }),
             'first_name_en': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل الاسم بالحروف اللاتينية',
            }),
            'last_name_en': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل اللقب بالحروف اللاتينية',
            }),
            
            'birth_day': forms.DateInput(attrs={
                'class': 'form-control',
                'placeholder': 'اختر تاريخ الميلاد',
                'type': 'date',  # Ensures the field displays a date picker in supported browsers
            }),
            'birth_place': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل مكان الميلاد',
            }),
            'birth_place_en': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل مكان الميلاد بالحروف اللاتينية',
            }),
            'birth_wilaya': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل الولاية',
            }),
            'birth_wilaya_en': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'tapper la wilaya',
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل البريد الإلكتروني',
            }),
             'ex_entreprise': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'مثال: المدرسة العليا للأساتذة بالقبة',
            }),
        }


class DomainForm(forms.ModelForm):
    class Meta:
        model = Domain
        fields = ['name', 'name_en']
        labels = {'name': 'اسم الميدان', 'name_en': 'الاسم بالفرنسية'}
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'id': 'editName',
                'style': 'text-align: right;',
                'dir': 'rtl',
            }),
            'name_en': forms.TextInput(attrs={
                'class': 'form-control',
                'id': 'editNameEn',
                'style': 'text-align: left;',
                'dir': 'ltr',
            }),
        }

class FiliereForm(forms.ModelForm):
    class Meta:
        model = Filiere
        fields = ['name', 'name_en', 'domain']  # Include both fields for the form
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'text-align: right;',
                'dir': 'rtl',
            }),
            'name_en': forms.TextInput(attrs={'class': 'form-control', 'style': 'text-align: left;', 'dir': 'ltr',}),
            'domain': forms.Select(attrs={
                'class': 'form-control',
                'style': 'text-align: right;',
                'dir': 'rtl',
            }),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Set queryset explicitly
        self.fields['domain'].queryset = Domain.objects.all()


class SpecialityForm(forms.ModelForm):
    class Meta:
        model = Speciality
        fields = ['name', 'name_en', 'filiere']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'name_en': forms.TextInput(attrs={'class': 'form-control', 'style': 'text-align: left;', 'dir': 'ltr',}),
            'filiere': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
        }
   

class UnityForm(forms.ModelForm):
    class Meta:
        model = Unity
        fields = ['name', 'code', 'speciality', 'pedagogic_year']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'code': forms.TextInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'speciality': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'pedagogic_year': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),

        }

class SubjectForm(forms.ModelForm):
    class Meta:
        model = Subject
        fields = ['name', 'credit', 'coeficient', 'unity']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'credit': forms.NumberInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'coeficient': forms.NumberInput(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'unity': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
        }   
             
from django.db.models import Q

class DeliberationForm(forms.ModelForm):
    class Meta:
        model = Deliberation
        fields = [
            'speciality', 'student', 'pedagogic_year', 'average_grade',
            'total_credits', 'academic_year', 
            'result_status', 'decision_date', 'mention', 'diploma_number'            
        ]
        widgets = {
            'speciality': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_speciality', 'name': 'speciality'}),
            'student': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_student', 'name': 'student'}),
            'pedagogic_year': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_pedagogic_year', 'name': 'pedagogic_year'}),
            'average_grade': forms.NumberInput(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_average_grade', 'name': 'average_grade'}),
            'total_credits': forms.NumberInput(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_total_credits', 'name': 'total_credits'}),

            'academic_year': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'editDeliberationAcademicYear', 'name': 'academic_year'}),
            'result_status': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'editDeliberationResultStatus', 'name': 'result_status'}),
            'decision_date': forms.DateInput(attrs={'class': 'form-control', 'dir': 'rtl', 'type': 'date', 'id': 'editDeliberationDate', 'name': 'decision_date'}),
            'mention': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'editDeliberationMention', 'id': 'editDeliberationMention', 'name': 'mention'}),
            'diploma_number': forms.NumberInput(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'id_diploma_number', 'name': 'diploma_number'}),
        }
        labels = {
            'student': 'الطالب',
            'pedagogic_year': 'السنة البيداغوجية',
            'academic_year': 'السنة الأكاديمية',
            'speciality': 'التخصص',
            'total_credits': 'المجموع الكلي للرصيد',
            'average_grade': 'المعدل العام',
            'result_status': 'حالة النتيجة',
            'decision_date': 'تاريخ القرار',
            'mention': 'التقدير',
            'diploma_number': 'رقم الشهادة',
        }

    def clean_diploma_number(self):
        diploma_number = self.cleaned_data.get('diploma_number')
        if diploma_number != 0:
            if Deliberation.objects.exclude(pk=self.instance.pk).filter(diploma_number=diploma_number).exists():
                raise forms.ValidationError('رقم الشهادة هذا قيد الاستخدام بالفعل.')
        return diploma_number
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Use Python logic to deduplicate year_name values
        all_years = PedagogicYear.objects.all()
        seen = set()
        unique_years = [year for year in all_years if year.year_name not in seen and not seen.add(year.year_name)]
        # Convert back into a QuerySet-compatible format
        self.fields['pedagogic_year'].queryset = PedagogicYear.objects.filter(
            Q(pk__in=[year.pk for year in unique_years])
        )
        self.fields['pedagogic_year'].label_from_instance = lambda obj: obj.year_name


class EnrollmentForm(forms.ModelForm):
    class Meta:
        model = Enrollment
        fields = ['matricule', 'student', 'speciality', 'pedagogic_year', 'academic_year']
        widgets = {
            'matricule': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'أدخل رقم التسجيل',
            }),
            'student': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'speciality': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
            'pedagogic_year': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl', 'id': 'editEnrollmentPedagogicYear'}),
            'academic_year': forms.Select(attrs={'class': 'form-control', 'dir': 'rtl'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Use DISTINCT with values_list to get unique year_name values
        pedagogic_year = PedagogicYear.objects.values_list('year_name', flat=True).distinct()
        # Filter queryset to include only records with unique year_name
        self.fields['pedagogic_year'].queryset = PedagogicYear.objects.filter(year_name__in=pedagogic_year)
        # Show only year_name in the dropdown
        self.fields['pedagogic_year'].label_from_instance = lambda obj: obj.year_name

class GradeForm(forms.ModelForm):
    speciality = forms.ModelChoiceField(
        queryset=Speciality.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control', 'name': 'speciality_id', 'id': 'id_speciality'}),
        required=True,
    )

    class Meta:
        model = Grade
        fields = ['speciality', 'student', 'subject', 'grade', 'session', 'pedagogic_year', 'academic_year']
        widgets = {
            'student': forms.Select(attrs={'class': 'form-control', 'id': 'id_student'}),
            'subject': forms.Select(attrs={'class': 'form-control', 'id': 'id_subject'}),
            'grade': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
            'session': forms.Select(attrs={'class': 'form-control'}),
            'pedagogic_year': forms.Select(attrs={'class': 'form-control'}),
            'academic_year': forms.Select(attrs={'class': 'form-control'}),
        }

   
   
    

class MemoireForm(forms.ModelForm):
    class Meta:
        model = Memoire
        fields = ['speciality', 'student', 'coeficient', 'credit', 'grade', 'session', 'academic_year', 'memoire_file']
        widgets = {
            'speciality': forms.Select(attrs={'class': 'form-control', 'id': 'editMemoireSpeciatity'}),
            'student': forms.Select(attrs={'class': 'form-control', 'id': 'editMemoireStudent'}),
            'coeficient': forms.NumberInput(attrs={'class': 'form-control'}),
            'credit': forms.NumberInput(attrs={'class': 'form-control'}),
            'grade': forms.NumberInput(attrs={'class': 'form-control'}),
            'session': forms.Select(attrs={'class': 'form-control'}),
            'academic_year': forms.Select(attrs={'class': 'form-control', 'id': 'editMemoireAcademicYear'}),
            'memoire_fille': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }
