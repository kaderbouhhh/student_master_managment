from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.core.files.storage import default_storage
from .models import Student, Filiere, Domain, Speciality, Unity, Subject, Deliberation, Enrollment, PedagogicYear, Grade, Memoire, StudentContrat
from .forms import StudentForm, FiliereForm, DomainForm, SpecialityForm, UnityForm, SubjectForm, DeliberationForm, EnrollmentForm, GradeForm, MemoireForm, StudentContratForm 
import csv
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
import logging
# views.pyfrom django.shortcuts import render, redirect
from django.shortcuts import render, redirect
from django.contrib import messages, auth
from django.conf import settings
import requests
from django.utils.timezone import now
from django.http import Http404
from django.db.models import Max
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from collections import defaultdict
from django.shortcuts import render, get_object_or_404
from django.db.models import Prefetch
from django.core.exceptions import ValidationError
import logging
from django.core.exceptions import ObjectDoesNotExist

@login_required(login_url='login')
def home(request):
    # Base queries
   
    students = Student.objects.all()
    
   
    # Pass data to the template
    return render(request, 'attendance/home.html', {
        'students': students,
      

    })
logger = logging.getLogger(__name__)
@login_required(login_url='login')
def diploma(request, id):
    # Retrieve the deliberation using the provided id
    deliberation = get_object_or_404(Deliberation, id=id)

    # Check if the result_status is 'ناجح'
    if deliberation.result_status != 'ناجح':
        # If not ناجح, raise 404 error or redirect to another page
        return redirect('deliberation_list')  # Replace 'deliberation_list' with the appropriate URL name

        # Alternatively, you can use:
        # return redirect('deliberation_list')  # Replace 'deliberation_list' with your URL name
      # If diploma_issued is not 0, redirect to another page or show an error
    # If diploma_issued is not 0, redirect to deliberation_list with an alert message
    if deliberation.diploma_issued != 0:
        logger.info(f"Diploma already issued for deliberation ID {id}")
        messages.warning(request, "لقد تم تسليم هذه الشهادة . لا يمكن تسليمها مرة أخرى.")
        return redirect('deliberation_list')  # Replace 'deliberation_list' with your URL name

    # If deliberation is valid and result_status is 'ناجح', proceed to fetch enrollment data
    enrollment = Enrollment.objects.filter(student=deliberation.student).select_related('student', 'speciality').first()

    if not enrollment:
        logger.warning(f"No enrollment found for student {deliberation.student.id}")
    user_is_admin = request.user.groups.filter(name='admins').exists()
    return render(request, 'attendance/diploma.html', {
        'deliberation': deliberation,
        'enrollment': enrollment,
        'user_is_admin': user_is_admin,
        'now': now(),
    })


@login_required(login_url='login')
def certificate(request, id):
    # Base queries
   
    enrollment = get_object_or_404(Enrollment, id=id)
    
   
    # Pass data to the template
    return render(request, 'attendance/certificate.html', {
        'enrollment': enrollment,
      
    })



logger = logging.getLogger(__name__)
@login_required(login_url='login')
def transcript(request, id):
    # جلب تفاصيل المداولة بناءً على المعرف (ID)
    deliberation = get_object_or_404(Deliberation, id=id)
    
    # جلب الطالب المرتبط بالمداولة
    student = deliberation.student
    
    # جلب سجل تسجيل الطالب في المؤسسة
    enrollment = Enrollment.objects.filter(student=student).first()

    # تعريف المتغيرات الافتراضية
    # تعريف القيم الافتراضية لتجنب UnboundLocalError
    unities_2 = []
    subjects_2 = []
    grades_2 = []
    subjects_unit_count_2 = []
    total_grades_sum_2 = 0
    total_subjects_2 = 0
    total_credit_2 = 0
    overall_average_2 = 'غير متوفرة'



    # جلب معلومات المذكرة (المذكرة تكون فقط للسنة الثانية)
    memoire = None
    if deliberation.pedagogic_year.year_name == 'الثانية':
        memoire = Memoire.objects.filter(speciality=deliberation.speciality, student=student).first()

        # جلب الوحدات الدراسية المرتبطة بتخصص وسنة الطالب
        unities = Unity.objects.filter(speciality=deliberation.speciality, pedagogic_year=deliberation.pedagogic_year)

        # جلب جميع المواد المرتبطة بهذه الوحدات
        subjects = Subject.objects.filter(unity__in=unities)

        # جلب الدرجات لكل المواد التي يدرسها هذا الطالب
        grades = Grade.objects.filter(student=student, subject__in=subjects).select_related('subject')
        # تعريف المتغيرات الخاصة بحساب المعدلات
        total_grades_sum = 0  # مجموع الدرجات النهائية لكل المواد
        total_subjects = 0  # عدد المواد التي حصل فيها الطالب على درجات
        total_credit = 0  # مجموع الأرصدة لجميع المواد
        subjects_unit_count = []  # قائمة تحتوي على تفاصيل المواد داخل كل وحدة

        # حساب تفاصيل كل وحدة دراسية
        for unity in unities:
            unity_subjects = subjects.filter(unity=unity)  # جلب جميع المواد التي تنتمي إلى الوحدة الحالية
            unity_grades_sum = 0  # مجموع درجات الوحدة مضروبة في المعامل
            unity_subjects_count = 0  # عدد المواد داخل الوحدة (معاملاتها)
            unity_credit = 0  # مجموع الأرصدة للوحدة
            subject_details = []  # قائمة لحفظ تفاصيل كل مادة داخل الوحدة

            for subject in unity_subjects:
                grade = grades.filter(subject=subject).first()  # جلب درجة الطالب في المادة الحالية
                grade_value = grade.grade if grade else None  # قيمة الدرجة، إذا لم تكن متاحة فتبقى None
                session = grade.session if grade else 'غير متوفرة'  # الدورة التي تمت فيها الامتحان

                if grade_value:
                    # حساب مجموع الدرجات مضروبًا في المعاملات لكل مادة
                    unity_grades_sum += grade_value * subject.coeficient
                    unity_subjects_count += subject.coeficient

                    # تحديث المجموع العام لجميع الدرجات
                    total_grades_sum += grade_value * subject.coeficient
                    total_subjects += subject.coeficient

                    # تحديث مجموع الأرصدة
                    unity_credit += subject.credit
                    total_credit += subject.credit

                # إضافة تفاصيل المادة إلى القائمة
                subject_details.append({
                    'subject': subject,
                    'grade': grade_value,
                    'session': session,
                })

            # حساب معدل الوحدة، مع التأكد من عدم القسمة على صفر
            unity_average = round(unity_grades_sum / unity_subjects_count, 2) if unity_subjects_count > 0 else 'غير متوفرة'

            # حفظ بيانات الوحدة داخل القائمة الرئيسية
            subjects_unit_count.append({
                'unity': unity,
                'subject_details': subject_details,
                'subject_count': unity_subjects.count() + 1,  # حساب عدد المواد في الوحدة
                'unity_average': unity_average,  # معدل الوحدة
                'unity_credit': unity_credit,  # مجموع الأرصدة للوحدة
            })

        # حساب المعدل العام للطالب
        overall_average = round(total_grades_sum / total_subjects, 2) if total_subjects > 0 else 'غير متوفرة'

        # حساب مجموع الأرصدة مع إضافة رصيد المذكرة إن وجد
        overall_credit = total_credit + (memoire.credit if memoire else 0)
        
        if memoire:
            if memoire.coeficient == 1:
                average = round((overall_average + (memoire.grade if memoire else 0)) / 2, 2) if overall_average != 'غير متوفرة' else 'غير متوفرة'
            # حساب المعدل النهائي، مع الأخذ بعين الاعتبار المذكرة إن وجدت
            else:
                average = round((overall_average*total_subjects + (memoire.grade*memoire.coeficient if memoire else 0)) / (total_subjects+memoire.coeficient), 2) if overall_average != 'غير متوفرة' else 'غير متوفرة'
        else:
            average = overall_average
    else :
             # جلب الوحدات الدراسية المرتبطة بتخصص وسنة الطالب
        unities = Unity.objects.filter(speciality=deliberation.speciality, pedagogic_year__contrat='الأول')
     # جلب جميع المواد المرتبطة بهذه الوحدات
        subjects = Subject.objects.filter(unity__in=unities)
     # جلب الدرجات لكل المواد التي يدرسها هذا الطالب
        grades = Grade.objects.filter(student=student, subject__in=subjects).select_related('subject')   
     # تعريف المتغيرات الخاصة بحساب المعدلات
        total_grades_sum = 0  # مجموع الدرجات النهائية لكل المواد
        total_subjects = 0  # عدد المواد التي حصل فيها الطالب على درجات
        total_credit = 0  # مجموع الأرصدة لجميع المواد
        subjects_unit_count = []  # قائمة تحتوي على تفاصيل المواد داخل كل وحدة
     # حساب تفاصيل كل وحدة دراسية
        for unity in unities:
            unity_subjects = subjects.filter(unity=unity)  # جلب جميع المواد التي تنتمي إلى الوحدة الحالية
            unity_grades_sum = 0  # مجموع درجات الوحدة مضروبة في المعامل
            unity_subjects_count = 0  # عدد المواد داخل الوحدة ( مجموع معاملاتها)
            unity_credit = 0  # مجموع الأرصدة للوحدة
            subject_details = []  # قائمة لحفظ تفاصيل كل مادة داخل الوحدة
            for subject in unity_subjects:
                    grade = grades.filter(subject=subject).first()  # جلب درجة الطالب في المادة الحالية
                    grade_value = grade.grade if grade else None  # قيمة الدرجة، إذا لم تكن متاحة فتبقى None
                    session = grade.session if grade else 'غير متوفرة'  # الدورة التي تمت فيها الامتحان
                    if grade_value:
                        # حساب مجموع الدرجات مضروبًا في المعاملات لكل مادة
                        unity_grades_sum += grade_value * subject.coeficient
                        unity_subjects_count += subject.coeficient
                     # تحديث المجموع العام لجميع الدرجات
                        total_grades_sum += grade_value * subject.coeficient
                        total_subjects += subject.coeficient
                     # تحديث مجموع الأرصدة
                        unity_credit += subject.credit
                        total_credit += subject.credit
                 # إضافة تفاصيل المادة إلى القائمة
                    subject_details.append({
                        'subject': subject,
                        'grade': grade_value,
                        'session': session,
                    })
         # حساب معدل الوحدة، مع التأكد من عدم القسمة على صفر
            unity_average = round(unity_grades_sum / unity_subjects_count, 2) if unity_subjects_count > 0 else 'غير متوفرة'
         # حفظ بيانات الوحدة داخل القائمة الرئيسية
            subjects_unit_count.append({
                'unity': unity,
                'subject_details': subject_details,
                'subject_count': unity_subjects.count() + 1,  # حساب عدد المواد في الوحدة
                'unity_average': unity_average,  # معدل الوحدة
                'unity_credit': unity_credit,  # مجموع الأرصدة للوحدة
            })
        # حساب المعدل العام للطالب
        overall_average = round(total_grades_sum / total_subjects, 2) if total_subjects > 0 else 'غير متوفرة'
       

            # جلب الوحدات الدراسية المرتبطة بتخصص وسنة الطالب
        pedagogic_year = PedagogicYear.objects.filter(contrat='الثاني').first()    
        # جلب الوحدات الدراسية المرتبطة بتخصص وسنة الطالب
        unities = Unity.objects.filter(speciality=deliberation.speciality, pedagogic_year=pedagogic_year)
     # جلب جميع المواد المرتبطة بهذه الوحدات
        subjects = Subject.objects.filter(unity__in=unities)
        unities_2 = unities
        subjects_2 = subjects
     # جلب الدرجات لكل المواد التي يدرسها هذا الطالب
        grades = Grade.objects.filter(student=student, subject__in=subjects).select_related('subject')   
     # تعريف المتغيرات الخاصة بحساب المعدلات
        total_grades_sum_2 = 0  # مجموع الدرجات النهائية لكل المواد
        total_subjects = 0  # عدد المواد التي حصل فيها الطالب على درجات
        total_credit_2 = 0  # مجموع الأرصدة لجميع المواد
        subjects_unit_count_2 = []  # قائمة تحتوي على تفاصيل المواد داخل كل وحدة
     # حساب تفاصيل كل وحدة دراسية
        for unity in unities:
            unity_subjects = subjects.filter(unity=unity)  # جلب جميع المواد التي تنتمي إلى الوحدة الحالية
            unity_grades_sum = 0  # مجموع درجات الوحدة مضروبة في المعامل
            unity_subjects_count = 0  # عدد المواد داخل الوحدة ( مجموع معاملاتها)
            unity_credit = 0  # مجموع الأرصدة للوحدة
            subject_details = []  # قائمة لحفظ تفاصيل كل مادة داخل الوحدة
            for subject in unity_subjects:
                    grade = grades.filter(subject=subject).first()  # جلب درجة الطالب في المادة الحالية
                    grade_value = grade.grade if grade else None  # قيمة الدرجة، إذا لم تكن متاحة فتبقى None
                    session = grade.session if grade else 'غير متوفرة'  # الدورة التي تمت فيها الامتحان
                    if grade_value:
                        # حساب مجموع الدرجات مضروبًا في المعاملات لكل مادة
                        unity_grades_sum += grade_value * subject.coeficient
                        unity_subjects_count += subject.coeficient
                     # تحديث المجموع العام لجميع الدرجات
                        total_grades_sum_2 += grade_value * subject.coeficient
                        total_subjects += subject.coeficient
                     # تحديث مجموع الأرصدة
                        unity_credit += subject.credit
                        total_credit_2 += subject.credit
                 # إضافة تفاصيل المادة إلى القائمة
                    subject_details.append({
                        'subject': subject,
                        'grade': grade_value,
                        'session': session,
                    })
         # حساب معدل الوحدة، مع التأكد من عدم القسمة على صفر
            unity_average = round(unity_grades_sum / unity_subjects_count, 2) if unity_subjects_count > 0 else 'غير متوفرة'
         # حفظ بيانات الوحدة داخل القائمة الرئيسية
            subjects_unit_count_2.append({
                'unity': unity,
                'subject_details': subject_details,
                'subject_count': len(unity_subjects) + 1,  # حساب عدد المواد في الوحدة
                'unity_average': unity_average,  # معدل الوحدة
                'unity_credit': unity_credit,  # مجموع الأرصدة للوحدة
            })
        # حساب المعدل العام للطالب
        overall_average_2 = round(total_grades_sum_2 / total_subjects, 2) if total_subjects > 0 else 'غير متوفرة'
       

        # حساب مجموع الأرصدة مع إضافة رصيد المذكرة إن وجد
        overall_credit = total_credit + total_credit_2
         # حساب المعدل النهائي، مع الأخذ بعين الاعتبار المذكرة إن وجدت
        average = round((overall_average + overall_average_2) / 2, 2) if overall_average != 'غير متوفرة' else 'غير متوفرة'

    # إعداد البيانات لإرسالها إلى القالب لعرضها في HTML
    context = {
        'unities': unities,  # قائمة الوحدات الدراسية
        'student': student,  # بيانات الطالب
        'enrollment': enrollment,  # تسجيل الطالب
        'deliberation': deliberation,  # بيانات المداولة

        'subjects_unit_count': subjects_unit_count,  # تفاصيل المواد داخل كل وحدة
        'total_subjects_count': len(subjects) + len(unities) - 1,  # إجمالي عدد المواد
        'average_counts': len(subjects) + len(unities),  # عدد الوحدات التي تم حساب معدلها
        'overall_average': overall_average,  # المعدل العام
        'total_credit': total_credit,  # مجموع الأرصدة
       
        'subjects_unit_count_2': subjects_unit_count_2,
        'total_subjects_count_2': len(subjects_2) + len(unities_2),
        'average_counts_2': len(subjects_2) + len(unities_2) -1,
        'overall_average_2': overall_average_2,
        'total_credit_2': total_credit_2,

        'memoire': memoire,  # بيانات المذكرة إن وجدت
        'overall_credit': overall_credit,  # مجموع الأرصدة بعد احتساب المذكرة
        'average': average,  # المعدل النهائي
    }

    # عرض صفحة كشف النقاط باستخدام القالب المناسب
    return render(request, 'attendance/transcript.html', context) 

@login_required(login_url='login')
def conduct(request, id):
    # جلب تفاصيل المداولة بناءً على المعرف (ID)
    deliberation = get_object_or_404(Deliberation, id=id)
    
    # جلب الطالب المرتبط بالمداولة
    student = deliberation.student
    context = {       
        'student': student,  # بيانات الطالب      
        'deliberation': deliberation, # بيانات المداولة      
    }
    # عرض صفحة القالب المناسب
    return render(request, 'attendance/conduct.html', context)

def login(request):
    if request.method == 'POST':
        # Step 1: Fetch reCAPTCHA response from the form
        recaptcha_response = request.POST.get('g-recaptcha-response')
        
        # Step 2: Validate reCAPTCHA
        if not recaptcha_response:
            messages.error(request, 'Please complete the reCAPTCHA.')
            return redirect('login')  # Immediate redirect if reCAPTCHA is not filled
        
        # Data to send to reCAPTCHA API
        data = {
            'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
            'response': recaptcha_response
        }
        
        # Make a POST request to reCAPTCHA
        try:
            r = requests.post('https://www.google.com/recaptcha/api/siteverify', data=data)
            result = r.json()
            print("reCAPTCHA verification data:", data)  # Debugging
            print("reCAPTCHA result:", result)           # Debugging
            
            # If reCAPTCHA fails, halt and send error message
            if not result.get('success'):
                messages.error(request, 'Invalid reCAPTCHA. Please try again.')
                return redirect('login')
        
        except requests.RequestException as e:
            print(f"reCAPTCHA verification error: {e}")
            messages.error(request, 'reCAPTCHA verification failed. Please try again.')
            return redirect('login')

        # Step 3: Authenticate user only after reCAPTCHA validation
        username = request.POST['username']
        password = request.POST['password']
        
        user = auth.authenticate(username=username, password=password)
        
        if user is not None:
            auth.login(request, user)
            return redirect('students')
        else:
            messages.error(request, 'البريد الإلكتروني أو كلمة المرور غير صحيح')  # Arabic error message

    return render(request, 'registration/login.html')

from django.contrib.auth import logout as auth_logout
def logout(request):
    auth_logout(request)
    return redirect('login')  # Adjust as needed


# List all students
def student_list(request):
    students = Student.objects.all()
    form = StudentForm()
    return render(request, 'dashboard/student_list.html', {'students': students, 'form': form})


# Add a new student (handles AJAX requests)
def student_add(request):
    if request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            student = form.save()
            new_student_row = render_to_string('dashboard/students/student_row.html', {'student': student})
            return JsonResponse({'new_student_row': new_student_row})
        return JsonResponse({'error': 'Invalid data', 'errors': form.errors}, status=400)


# Edit a student's details
def student_edit(request, student_id):
    student = get_object_or_404(Student, id=student_id)
    if request.method == 'POST':
        form = StudentForm(request.POST, instance=student)
        if form.is_valid():
            student = form.save()
             # Render the updated row for dynamic table updates
            updated_row = render_to_string('dashboard/partials/student_row.html', {'student': student}, request=request)
            return JsonResponse({'student_id': student.id, 'updated_row': updated_row, "status": "success"})
            
        return JsonResponse({'status': 'error', 'errors': form.errors}, status=400)
    else:
        form = StudentForm(instance=student)
    return render(request, 'dashboard/modals/student_modals.html', {'form': form, 'student': student})


# Get a student's data (AJAX endpoint)
def student_data(request, id):
    student = get_object_or_404(Student, id=id)
    data = {
        'first_name': student.first_name,
        'last_name': student.last_name,
        'first_name_en': student.first_name_en,
        'last_name_en': student.last_name_en,
        'birth_day': student.birth_day,
        'birth_place': student.birth_place,
        'birth_place_en': student.birth_place_en,
        'birth_wilaya': student.birth_wilaya,
        'birth_wilaya_en': student.birth_wilaya_en,
        'email': student.email,
        
        'ex_entreprise': student.ex_entreprise,
    }
    return JsonResponse(data)


logger = logging.getLogger(__name__)

def student_delete(request, id):
    if request.method == 'POST':
        try:
            student = get_object_or_404(Student, id=id)
            student.delete()
            return JsonResponse({'student_id': id})
        except Exception as e:
            logger.error(f"Error deleting student: {e}")
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request'}, status=400)


# Import students from a CSV file
def student_import_csv(request):
    if request.method == 'POST' and 'csv_file' in request.FILES:
        csv_file = request.FILES['csv_file']
        file_path = default_storage.save('tmp/' + csv_file.name, csv_file)

        with default_storage.open(file_path, 'r', encoding='utf-8') as file:
            reader = csv.DictReader(file)
            students_added = 0
            for row in reader:
                student, created = Student.objects.get_or_create(
                    email=row['email'],
                    defaults={
                        'matricule': row['matricule'],
                        'first_name': row['first_name'],
                        'last_name': row['last_name'],
                        'speciality': row['speciality'],
                        'pedagogic_year_id': row['academic_year'],  # Ensure the year exists
                        'group': row['group'],
                    }
                )
                if created:
                    students_added += 1

        default_storage.delete(file_path)
        return JsonResponse({'status': 'success', 'students_added': students_added})

    return JsonResponse({'status': 'error', 'message': 'Invalid file or request'}, status=400)


def domain_list(request):
    domains = Domain.objects.all()
    form = DomainForm()
    context = {
        'domains': domains,
        'form': form,
    }
    return render(request, 'dashboard/domain_list.html', context)

def domain_add(request):
    if request.method == 'POST':
        form = DomainForm(request.POST)
        if form.is_valid():
            domain = form.save()
            new_row = render_to_string('dashboard/partials/domain_row.html', {'domain': domain})
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

def domain_edit(request, id):
    domain = get_object_or_404(Domain, id=id)
    if request.method == 'POST':
        form = DomainForm(request.POST, instance=domain)
        if form.is_valid():
            domain = form.save()
            updated_row = render_to_string('dashboard/partials/domain_row.html', {'domain': domain})
            return JsonResponse({'domain_id': domain.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)


def domain_data(request, id):
    domain = get_object_or_404(Domain, id=id)
    data = {
        'name': domain.name,
        'name_en': domain.name_en,
     
    }
    return JsonResponse(data)

def domain_delete(request, id):
    domain = get_object_or_404(Domain, id=id)
    if request.method == 'POST':
        domain.delete()
        return JsonResponse({'domain_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


# عرض قائمة الفروع
def filiere_list(request):
    filieres = Filiere.objects.select_related('domain').all()
    domains = Domain.objects.all()
    form = FiliereForm()
    return render(request, 'dashboard/filiere_list.html', {
        'filieres': filieres,
        'domains': domains,
        'form': form,
    })

# إضافة فرع جديد
def filiere_add(request):
    if request.method == 'POST':
        form = FiliereForm(request.POST)
        if form.is_valid():
            filiere = form.save()
            new_row = render_to_string('dashboard/partials/filiere_row.html', {'filiere': filiere})
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# تعديل فرع
def filiere_edit(request, id):
    filiere = get_object_or_404(Filiere, id=id)
    if request.method == 'POST':
        form = FiliereForm(request.POST, instance=filiere)
        if form.is_valid():
            filiere = form.save()
            updated_row = render_to_string('dashboard/partials/filiere_row.html', {'filiere': filiere})
            return JsonResponse({'filiere_id': filiere.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

def filiere_data(request, id):
    filiere = get_object_or_404(Filiere, id=id)
    data = {
        'name': filiere.name,
        'namen': filiere.name_en,
        'domain': filiere.domain,
     
    }
    return JsonResponse(data)

# حذف فرع
def filiere_delete(request, id):
    filiere = get_object_or_404(Filiere, id=id)
    if request.method == 'POST':
        filiere.delete()
        return JsonResponse({'filiere_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


def speciality_list(request):
    specialities = Speciality.objects.all()
    filieres = Filiere.objects.all()
    form = SpecialityForm()
    return render(request, 'dashboard/speciality_list.html', {
        'specialities': specialities,
        'filieres': filieres,
        'form': form
    })

def speciality_add(request):
    if request.method == 'POST':
        form = SpecialityForm(request.POST)
        if form.is_valid():
            speciality = form.save()
            new_row = render_to_string('dashboard/partials/speciality_row.html', {'speciality': speciality}, request=request)
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

def speciality_edit(request, id):
    speciality = get_object_or_404(Speciality, id=id)
    if request.method == 'POST':
        form = SpecialityForm(request.POST, instance=speciality)
        if form.is_valid():
            speciality = form.save()
            updated_row = render_to_string('dashboard/partials/speciality_row.html', {'speciality': speciality}, request=request)
            return JsonResponse({'speciality_id': speciality.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)


def speciality_delete(request, id):
    speciality = get_object_or_404(Speciality, id=id)
    if request.method == 'POST':
        speciality.delete()
        return JsonResponse({'speciality_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)

# List all Unities
def unity_list(request):
    unities = Unity.objects.all()
    specialities = Speciality.objects.all()
    form = UnityForm()
    return render(request, 'dashboard/unity_list.html', {
        'unities': unities,
        'specialities': specialities,
        'form': form,
    })

# Add Unity
def unity_add(request):
    if request.method == 'POST':
        form = UnityForm(request.POST)
        if form.is_valid():
            unity = form.save()
            new_row = render_to_string('dashboard/partials/unity_row.html', {'unity': unity}, request=request)
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# Edit Unity
def unity_edit(request, id):
    unity = get_object_or_404(Unity, id=id)
    if request.method == 'POST':
        form = UnityForm(request.POST, instance=unity)
        if form.is_valid():
            unity = form.save()
            updated_row = render_to_string('dashboard/partials/unity_row.html', {'unity': unity}, request=request)
            return JsonResponse({'unity_id': unity.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

def unity_data(request, id):
    unity = get_object_or_404(Unity, id=id)
    data = {
        'name': unity.name,
        'code': unity.code,
        'pedagogicyear': unity.pedagogic_year,
     
    }
    return JsonResponse(data)

# Delete Unity
def unity_delete(request, id):
    unity = get_object_or_404(Unity, id=id)
    if request.method == 'POST':
        unity.delete()
        return JsonResponse({'unity_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


# List all Subjects
def subject_list(request):
    subjects = Subject.objects.all()
    unities = Unity.objects.all()
    form = SubjectForm()
    return render(request, 'dashboard/subject_list.html', {
        'subjects': subjects,
        'unities': unities,
        'form': form,
    })

# Add Subject
def subject_add(request):
    if request.method == 'POST':
        form = SubjectForm(request.POST)
        if form.is_valid():
            subject = form.save()
            new_row = render_to_string('dashboard/partials/subject_row.html', {'subject': subject}, request=request)
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# Edit Subject
def subject_edit(request, id):
    subject = get_object_or_404(Subject, id=id)
    if request.method == 'POST':
        form = SubjectForm(request.POST, instance=subject)
        if form.is_valid():
            subject = form.save()
            updated_row = render_to_string('dashboard/partials/subject_row.html', {'subject': subject}, request=request)
            return JsonResponse({'subject_id': subject.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# Delete Subject
def subject_delete(request, id):
    subject = get_object_or_404(Subject, id=id)
    if request.method == 'POST':
        subject.delete()
        return JsonResponse({'subject_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)

def get_students_by_speciality(request):
    speciality_id = request.GET.get('speciality_id')
    if not speciality_id:
        return JsonResponse({'error': 'No speciality ID provided'}, status=400)

    # Fetch students enrolled in the selected speciality
    enrollments = Enrollment.objects.filter(speciality_id=speciality_id).select_related('student').distinct()

    # Extract unique students
    students = [enrollment.student for enrollment in enrollments]

    # Prepare student data for response
    student_data = [{'id': student.id, 'name': str(student)} for student in students]

    return JsonResponse(student_data, safe=False)

# List Deliberations
def deliberation_list(request):
    # Get filter values from the request
    speciality_id = request.GET.get('speciality')  # Get speciality ID
    year_pedagogic = request.GET.get('pedagogicyear')  # Get pedagogic year name
    year_academic = request.GET.get('year_academic')  # Get academic year string

    # Initial query for all deliberations
    deliberations = Deliberation.objects.all()

    # Apply filters
    if speciality_id:
        deliberations = deliberations.filter(speciality_id=speciality_id)
    if year_pedagogic:
        deliberations = deliberations.filter(pedagogic_year__year_name=year_pedagogic)
    if year_academic:
        deliberations = deliberations.filter(academic_year=year_academic)

    # Prepare dropdown values
    specialities = Speciality.objects.all()
    students = Student.objects.all()
    pedagogic_years = PedagogicYear.objects.all().order_by('year_name')

    # Ensure uniqueness
    unique_pedagogic_years = []
    seen_years = set()
    for year in pedagogic_years:
        if year.year_name not in seen_years:
            unique_pedagogic_years.append(year)
            seen_years.add(year.year_name)    
    academic_years = Deliberation.objects.values_list('academic_year', flat=True).distinct()
    enrollments = Enrollment.objects.all()
    # Optional form (if used in the template for adding/editing deliberations)
    form = DeliberationForm()
    # Render the template
    context = {
        'deliberations': deliberations,
        'specialities': specialities,
        'students': students,
        'pedagogic_years': unique_pedagogic_years,
        'academic_years': academic_years,
        'enrollments': enrollments,
        'form': form,
    }
    return render(request, 'dashboard/deliberation_list.html', context)


def get_student_data(request):
    student_id = request.GET.get('student_id')
    pedagogic_year_id = request.GET.get('pedagogic_year_id')

    # Fetch the Memoire object for the student (only the first one, if it exists)
    memoire = Memoire.objects.filter(student=student_id).first()

    # Fetch all grades for the student
    grades = Grade.objects.filter(student=student_id, pedagogic_year=pedagogic_year_id).select_related('subject')

    total_credits = 0
    total_weighted_grade = 0
    total_coeficient = 0

    # Calculate total credits and the weighted average grade
    for grade in grades:
        subject = grade.subject
        if grade.grade >= 10:
            total_credits += subject.credit
        total_weighted_grade += grade.grade * subject.coeficient
        total_coeficient += subject.coeficient

    # Calculate the average grade for the semester
    average_grade_semestre = total_weighted_grade / total_coeficient if total_coeficient > 0 else 0

    # Calculate the final average grade including Memoire grade (if available)
    if memoire and memoire.grade:  # Ensure memoire exists and has a grade
        average_grade = (average_grade_semestre + memoire.grade) / 2
        total_credits += memoire.credit
    else:
        average_grade = average_grade_semestre  # If no memoire, use the semester average alone

    # Get the next diploma number
    max_diploma_number = Deliberation.objects.aggregate(Max('diploma_number'))['diploma_number__max'] or 0
    next_diploma_number = max_diploma_number + 1

    return JsonResponse({
        'total_credits': total_credits,
        'average_grade': round(average_grade, 2),  # Round to 2 decimal places
        'diploma_number': next_diploma_number,  # Pass the next diploma number
    })
@csrf_exempt
def issue_diploma(request, id):
    if request.method == "POST":
        try:
            # جلب سجل المداولة بواسطة الـ ID
            deliberation = Deliberation.objects.get(pk=id)
            
            # التحقق مما إذا كان قد تم إصدار الشهادة بالفعل
            if deliberation.diploma_issued:
                return JsonResponse({"status": "error", "message": "الشهادة تم إصدارها بالفعل."}, status=400)

            # تحديث حالة إصدار الشهادة
            deliberation.diploma_issued = True
            deliberation.issued_date = now()  # استدعاء now() بدلاً من now
            deliberation.save()
            
            return JsonResponse({"status": "success", "message": "تم إصدار الشهادة بنجاح."})
        except Deliberation.DoesNotExist:
            return JsonResponse({"status": "error", "message": "لم يتم العثور على المداولة."}, status=404)
    return JsonResponse({"status": "error", "message": "طلب غير صالح. يُسمح فقط بـ POST."}, status=400)

@csrf_exempt
def issue_transcript(request, id):
    if request.method == "POST":
        try:
            # Fetch the deliberation instance using the URL parameter `id`
            deliberation = Deliberation.objects.get(pk=id)
            
            # Update the transcript_issued attribute
            deliberation.transcript_issued = True
            deliberation.save()
            
            return JsonResponse({"status": "success", "message": "تم تسليم كشف النقاط بنجاح."})
        except Deliberation.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Deliberation not found."}, status=404)
    return JsonResponse({"status": "error", "message": "Invalid request method. Only POST allowed."}, status=400)

# Add Deliberation
def deliberation_add(request):
    if request.method == 'POST':
        form = DeliberationForm(request.POST)
        if form.is_valid():
            deliberation = form.save()
            new_row = render_to_string('dashboard/partials/deliberation_row.html', {'deliberation': deliberation}, request=request)
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

logger = logging.getLogger(__name__)

def deliberation_edit(request, id):
    deliberation = get_object_or_404(Deliberation, id=id)
    if request.method == 'POST':
        form = DeliberationForm(request.POST, instance=deliberation)
        if form.is_valid():
            try:
                deliberation = form.save()
                updated_row = render_to_string('dashboard/partials/deliberation_row.html', {'deliberation': deliberation}, request=request)
                return JsonResponse({'deliberation_id': deliberation.id, 'updated_row': updated_row})
            except Exception as e:
                logger.error(f"Error updating deliberation: {e}")
                return JsonResponse({'error': str(e)}, status=500)
        else:
            logger.error(f"Form errors: {form.errors}")
            return JsonResponse({'error': form.errors}, status=400)
    return JsonResponse({'error': 'Invalid request method'}, status=405)

def deliberation_data(request, id):
    deliberation = get_object_or_404(Deliberation, id=id)
    data = {
        'id': deliberation.id,        
        'speciality': deliberation.speciality.id,
        'student': deliberation.student.id,
        'total_credits': deliberation.total_credits,
        'average_grade': deliberation.average_grade,
        'academic_year': deliberation.academic_year,
        'result_status': deliberation.result_status,
        'decision_date': deliberation.decision_date.strftime('%Y-%m-%d'),  # Format date as string
        'diploma_number': deliberation.diploma_number,
        'pedagogic_year': deliberation.pedagogic_year.id,
        'mention': deliberation.mention,
    }
    return JsonResponse(data)

# Delete Deliberation
def deliberation_delete(request, id):
    deliberation = get_object_or_404(Deliberation, id=id)
    if request.method == 'POST':
        deliberation.delete()
        return JsonResponse({'deliberation_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)

# List all Enrollments

def enrollment_list(request):
    # Get filter values from the request
    speciality_id = request.GET.get('speciality')  # Get speciality ID
    year_pedagogic = request.GET.get('pedagogicyear')  # Get pedagogic year ID
    year_academic = request.GET.get('year_academic')  # Get academic year string

    # Initial query for all enrollments
    enrollments = Enrollment.objects.all()

    # Apply filters
    if speciality_id:
        enrollments = enrollments.filter(speciality_id=speciality_id)
    if year_pedagogic:
        enrollments = enrollments.filter(pedagogic_year__year_name=year_pedagogic)
    if year_academic:
        enrollments = enrollments.filter(academic_year=year_academic)

    # Prepare dropdown values
    specialities = Speciality.objects.all()
    students = Student.objects.all()
    pedagogic_years = PedagogicYear.objects.all().order_by('year_name')
    
    # Ensure uniqueness
    unique_pedagogic_years = []
    seen_years = set()
    for year in pedagogic_years:
        if year.year_name not in seen_years:
            unique_pedagogic_years.append(year)
            seen_years.add(year.year_name)

    academic_years = Enrollment.objects.values_list('academic_year', flat=True).distinct()

    # For additional domains if required
    domains = Domain.objects.all()

    # Prepare form for adding enrollments
    form = EnrollmentForm()
    user_is_admin = request.user.groups.filter(name='admins').exists()
    # Context to render the template
    context = {
        'enrollments': enrollments,
        'specialities': specialities,
        'students': students,
        'pedagogic_years': unique_pedagogic_years,
        'academic_years': academic_years,
        'domains': domains,
        'form': form,
        'user_is_admin': user_is_admin,
        'now': now(),
    }

    return render(request, 'dashboard/enrollment_list.html', context)

# Add Enrollment
def enrollment_add(request):
    if request.method == 'POST':
        form = EnrollmentForm(request.POST)
        if form.is_valid():
            enrollment = form.save()
            new_row = render_to_string('dashboard/partials/enrollment_row.html', {'enrollment': enrollment}, request=request)
            return JsonResponse({'new_row': new_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# Edit Enrollment
def enrollment_edit(request, id):
    enrollment = get_object_or_404(Enrollment, id=id)
    if request.method == 'POST':
        print("POST data:", request.POST)  # Log all POST data

        form = EnrollmentForm(request.POST, instance=enrollment)
        if form.is_valid():
            enrollment = form.save()
            updated_row = render_to_string(
                'dashboard/partials/enrollment_row.html',
                {'enrollment': enrollment},
                request=request
            )
            return JsonResponse({'enrollment_id': enrollment.id, 'updated_row': updated_row})
        else:
            print("Form errors:", form.errors)  # Log form errors
            return JsonResponse({'error': form.errors}, status=400)
    return JsonResponse({'error': 'Invalid request'}, status=400)


def enrollment_delete(request, id):
    enrollment = get_object_or_404(Enrollment, id=id)
    if request.method == 'POST':
        enrollment.delete()
        return JsonResponse({'enrollment_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


@csrf_exempt
def issue_badge(request, id):
    if request.method == "POST":
        try:
            enrollment = Enrollment.objects.get(pk=id)

            if enrollment.badge_issued:
                return JsonResponse({"status": "error", "message": "البطاقة تم إصدارها بالفعل."}, status=400)

            enrollment.badge_issued = True
            enrollment.issued_badge_date = now()
            enrollment.save()

            return JsonResponse({"status": "success", "message": "تم إصدار البطاقة بنجاح."})
        except Enrollment.DoesNotExist:
            return JsonResponse({"status": "error", "message": "لم يتم العثور على التسجيل."}, status=404)

    return JsonResponse({"status": "error", "message": "طلب غير صالح. يُسمح فقط بـ POST."}, status=400)


logger = logging.getLogger(__name__)

def grade_list(request):
    grades = Grade.objects.select_related('student', 'subject', 'pedagogic_year').all()
    form = GradeForm()
    return render(request, 'dashboard/grade_list.html', {'grades': grades, 'form': form})

from django.core.exceptions import ObjectDoesNotExist

def get_students_and_subjects(request):
    """Fetch students and subjects based on the selected speciality."""
    speciality_id = request.GET.get('speciality_id')
    if speciality_id:
        try:
            # Fetch the speciality to ensure it exists
            speciality = Speciality.objects.get(pk=speciality_id)
            
            # Fetch students associated with the speciality via Enrollment
            students = list(
                Enrollment.objects.filter(speciality_id=speciality_id)
                .values('student__id', 'student__first_name', 'student__last_name')
            )
            
            students = [{
                'id': student['student__id'],
                'first_name': student['student__first_name'],
                'last_name': student['student__last_name']
            } for student in students]

            # Fetch subjects associated with the speciality via Unity
            subjects = list(
                Subject.objects.filter(unity__speciality_id=speciality_id)
                .values('id', 'name')
            )
            
            return JsonResponse({'students': students, 'subjects': subjects})
        except ObjectDoesNotExist:
            return JsonResponse({'students': [], 'subjects': []}, status=404)
    
    # Default response if no `speciality_id` is provided
    return JsonResponse({'students': [], 'subjects': []})


def grade_create(request):
    if request.method == 'POST':
        form = GradeForm(request.POST)
        if form.is_valid():
            grade = form.save()
            new_row = render_to_string('dashboard/partials/grade_row.html', {'grade': grade})
            return JsonResponse({'status': 'success', 'new_row': new_row})
        return JsonResponse({'status': 'error', 'errors': form.errors})
    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})

def grade_edit(request, grade_id):
    grade = get_object_or_404(Grade, pk=grade_id)
    
    # Handling the POST request to update the grade
    if request.method == 'POST':
        form = GradeForm(request.POST, instance=grade)
        if form.is_valid():
            grade = form.save()
            updated_row = render_to_string('dashboard/partials/grade_row.html', {'grade': grade})
            return JsonResponse({'status': 'success', 'updated_row': updated_row, 'grade_id': grade.id})
        return JsonResponse({'status': 'error', 'errors': form.errors})
    
    # For GET request to load the edit form
    form = GradeForm(instance=grade)
    form_html = render_to_string('dashboard/modals/edit_form.html', {'form': form})
    return JsonResponse({'form_html': form_html})

def grade_delete(request, id):
    grade = get_object_or_404(Grade, id=id)
    if request.method == 'POST':
        grade.delete()
        return JsonResponse({'grade_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


# List all Memoires
def memoire_list(request):
     # Get filter values from the request
    speciality_id = request.GET.get('speciality')  # Get speciality ID
    year_academic = request.GET.get('year_academic')  # Get academic year string
    memoires = Memoire.objects.all()
     # Apply filters
    if speciality_id:
        memoires = memoires.filter(speciality_id=speciality_id)
    if year_academic:
        memoires = memoires.filter(academic_year=year_academic)

    # Prepare dropdown values
    specialities = Speciality.objects.all()
    academic_years = Memoire.objects.values_list('academic_year', flat=True).distinct()

    # Optional form (if used in the template for adding/editing deliberations)
    form = MemoireForm()
    # Render the template
    context = {
        'memoires': memoires,
        'specialities': specialities,
        'academic_years': academic_years,
        'form': form,
    }
    form = MemoireForm()
    return render(request, 'dashboard/memoire_list.html', context)

from django.views.decorators.csrf import csrf_exempt  # If using AJAX
from django.core.files.storage import default_storage

@csrf_exempt  # Remove this if CSRF protection is needed
def memoire_add(request):
    if request.method == 'POST':
        form = MemoireForm(request.POST, request.FILES)  # Ensure FILES are passed
        if form.is_valid():
            memoire = form.save(commit=False)

            # Handle file upload manually (optional check)
            if 'memoire_file' in request.FILES:
                memoire.memoire_file = request.FILES['memoire_file']

            memoire.save()  # Save the model instance
            
            # Render the new row to update the UI dynamically
            new_row = render_to_string('dashboard/partials/memoire_row.html', {'memoire': memoire}, request=request)
            
            return JsonResponse({'success': True, 'new_row': new_row})
        else:
            return JsonResponse({'success': False, 'errors': form.errors}, status=400)
    
    return JsonResponse({'error': 'Invalid request method'}, status=405)

def upload_memoire_file(request):
    if request.method == 'POST' and request.FILES.get('memoire_file'):
        memoire_id = request.POST.get('memoire_id')
        memoire = get_object_or_404(Memoire, id=memoire_id)

        # Only allow upload if no file exists
        if not memoire.memoire_file:
            memoire.memoire_file = request.FILES['memoire_file']
            memoire.save()
            
            # Return new file link for AJAX update
            file_url = memoire.memoire_file.url
            return JsonResponse({'success': True, 'file_url': file_url})

        return JsonResponse({'success': False, 'error': 'File already exists'}, status=400)

    return JsonResponse({'success': False, 'error': 'Invalid request'}, status=400)

# Edit Memoire
def memoire_edit(request, id):
    memoire = get_object_or_404(Memoire, id=id)
    if request.method == 'POST':
        form = MemoireForm(request.POST, instance=memoire)
        if form.is_valid():
            memoire = form.save()
            updated_row = render_to_string('dashboard/partials/memoire_row.html', {'memoire': memoire}, request=request)
            return JsonResponse({'memoire_id': memoire.id, 'updated_row': updated_row})
    return JsonResponse({'error': 'Invalid data'}, status=400)

# Delete Memoire
def memoire_delete(request, id):
    memoire = get_object_or_404(Memoire, id=id)
    if request.method == 'POST':
        memoire.delete()
        return JsonResponse({'memoire_id': id})
    return JsonResponse({'error': 'Invalid request'}, status=400)


# List all student contracts
def student_contrat_list(request):
    contrats = StudentContrat.objects.all()
    form = StudentContratForm()
    return render(request, "dashboard/student_contrat.html", {"contrats": contrats, "form": form})

# Add a new student contract (handles AJAX requests)
def student_contrat_add(request):
    if request.method == "POST":
        form = StudentContratForm(request.POST)
        if form.is_valid():
            contrat = form.save()
            new_contrat_row = render_to_string("dashboard/partials/student_contrat_row.html", {"contrat": contrat}, request=request)
            return JsonResponse({"new_contrat_row": new_contrat_row, "status": "success"})
        return JsonResponse({"status": "error", "errors": form.errors}, status=400)

def student_contrat_edit(request, contrat_id):  # ✅ Match URL parameter name
    contrat = get_object_or_404(StudentContrat, id=contrat_id)
    
    if request.method == "POST":
        print("Received POST Data:", request.POST)  # Debugging line
        form = StudentContratForm(request.POST, instance=contrat)

        if form.is_valid():
            contrat = form.save()
            updated_row = render_to_string("dashboard/partials/student_contrat_row.html", {"contrat": contrat}, request=request)
            return JsonResponse({"contrat_id": contrat.id, "updated_row": updated_row, "status": "success"})
        
        print("Form Errors:", form.errors)  # Debugging line
        return JsonResponse({"status": "error", "errors": form.errors}, status=400)
    
    else:
        form = StudentContratForm(instance=contrat)
        return render(request, "dashboard/modals/student_contrat_modals.html", {"form": form, "contrat": contrat})

# Delete a student contract (handles AJAX requests)
def student_contrat_delete(request, id):
    if request.method == "POST":
        try:
            contrat = get_object_or_404(StudentContrat, id=id)
            contrat.delete()
            return JsonResponse({"id": id, "status": "success"})
        except Exception as e:
            return JsonResponse({"status": "error", "message": str(e)}, status=500)

    return JsonResponse({"status": "error", "message": "Invalid request"}, status=400)

# Get a student contract's data (AJAX endpoint)
def student_contrat_data(request, id):
    contrat = get_object_or_404(StudentContrat, id=id)
    data = {
        'first_name': contrat.first_name,
        'last_name': contrat.last_name,
        'first_name_en': contrat.first_name_en,
        'last_name_en': contrat.last_name_en,
        'birth_day': contrat.birth_day,
        'birth_place': contrat.birth_place,
        'birth_place_en': contrat.birth_place_en,
        'birth_wilaya': contrat.birth_wilaya,
        'birth_wilaya_en': contrat.birth_wilaya_en,
        'address': contrat.address,
        'live_wilaya': contrat.live_wilaya,
        'email': contrat.email,
        'branch': contrat.branch,
        'category': contrat.category,
        'sexe': contrat.sexe,
        'academic_year': contrat.academic_year,
    }
    return JsonResponse(data)


import csv
import pandas as pd  # To handle Excel files
from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import StudentContrat
from .forms import StudentContratForm

@csrf_exempt
def import_student_contrats(request):
    if request.method == "POST" and request.FILES.get("csv_file"):
        csv_file = request.FILES["csv_file"]
        file_extension = csv_file.name.split(".")[-1].lower()

        try:
            if file_extension == "csv":
                df = pd.read_csv(csv_file)  # Read CSV file
            elif file_extension in ["xls", "xlsx"]:
                df = pd.read_excel(csv_file)  # Read Excel file
            else:
                return JsonResponse({"error": "Invalid file format. Only CSV or Excel files are allowed."}, status=400)

            imported_count = 0
            errors = []

            for _, row in df.iterrows():
                try:
                    StudentContrat.objects.create(
                        first_name=row.get("first_name", ""),
                        last_name=row.get("last_name", ""),
                        first_name_en=row.get("first_name_en", ""),
                        last_name_en=row.get("last_name_en", ""),
                        birth_day=row.get("birth_day", ""),
                        birth_place=row.get("birth_place", ""),
                        birth_place_en=row.get("birth_place_en", ""),
                        birth_wilaya=row.get("birth_wilaya", ""),
                        birth_wilaya_en=row.get("birth_wilaya_en", ""),
                        address=row.get("address", ""),
                        live_wilaya=row.get("live_wilaya", ""),
                        email=row.get("email", ""),
                        sexe=row.get("sexe", ""),
                        branch=row.get("branch", ""),
                        category=row.get("category", ""),
                        academic_year=row.get("academic_year", ""),
                    )
                    imported_count += 1
                except Exception as e:
                    errors.append(str(e))

            if errors:
                return JsonResponse({"status": "error", "message": "Some rows could not be imported.", "errors": errors}, status=400)

            return JsonResponse({"status": "success", "message": f"{imported_count} student contracts imported successfully."})

        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)

    return JsonResponse({"error": "Invalid request"}, status=400)


def contract(request, id):
    # Base queries
   
    student_contrat = get_object_or_404(StudentContrat, id=id)
    
   
    # Pass data to the template
    return render(request, 'attendance/student_contrat.html', {
        'student_contrat': student_contrat,
      
    })

from django.core.mail import EmailMessage
from django.http import JsonResponse
from django.template.loader import render_to_string
from weasyprint import HTML, CSS
import json
import os
from django.conf import settings
from .models import StudentContrat  # Ensure this model exists

@csrf_exempt
def send_contracts_email(request):
    if request.method == "POST":
        try:
            # Load contract IDs from request
            data = json.loads(request.POST.get("contracts", "[]"))
            selected_contracts = StudentContrat.objects.filter(id__in=data)

            if not selected_contracts.exists():
                return JsonResponse({"status": "error", "message": "No valid contracts found"}, status=400)

            for contrat in selected_contracts:
                # Generate PDF contract
                pdf_filename = f"{contrat.first_name}_{contrat.last_name}.pdf"

                pdf_path = os.path.join(settings.MEDIA_ROOT, "contracts", pdf_filename)

                # Ensure contracts directory exists
                os.makedirs(os.path.dirname(pdf_path), exist_ok=True)

                # Render contract HTML template
                html_content = render_to_string("attendance/student_contrat.html", {"student_contrat": contrat})

                # Define custom CSS for PDF layout
                custom_css = CSS(string="""
                    @page {
                        size: A4;
                        margin: 0;
                    }
                    body {
                        margin: 0;
                        padding: 0;
                    }
                """)

                # Convert HTML to PDF and save it
                HTML(string=html_content).write_pdf(pdf_path, stylesheets=[custom_css])

                # Email setup
                email_subject = "عقد الطالب الخاص بك"
                email_body = f"""
                مرحبًا {contrat.first_name} {contrat.last_name},\n\n
                يرجى العثور على عقدك مرفقًا في هذا البريد الإلكتروني.\n
                شكرًا.
                """
                
                email = EmailMessage(
                    subject=email_subject,
                    body=email_body,
                    from_email="yahyasinor@gmail.com",
                    to=[contrat.email],
                )

                # Attach the PDF file
                with open(pdf_path, "rb") as pdf_file:
                    email.attach(pdf_filename, pdf_file.read(), "application/pdf")

                # Send email
                email.send()

                # Remove the generated PDF file after sending the email
                os.remove(pdf_path)

            return JsonResponse({"status": "success", "message": "Emails sent successfully."})

        except Exception as e:
            return JsonResponse({"status": "error", "message": str(e)}, status=500)

from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML, CSS
import os
from django.conf import settings
from .models import StudentContrat  # Ensure you have this model

def generate_contract_pdf(request, contrat_id):
    # Fetch the contract details
    try:
        student_contrat = StudentContrat.objects.get(id=contrat_id)
    except StudentContrat.DoesNotExist:
        return HttpResponse("Contract not found", status=404)

    # Render the HTML template with student data
    html_content = render_to_string("attendance/student_contrat.html", {"student_contrat": student_contrat})

    # Define custom CSS to remove margins and set A4 size
    custom_css = CSS(string="""
        @page {
            size: A4;
            margin: 0;
        }
        body {
            margin: 0;
            padding: 0;
        }
                     .contrat {
                font-family: Amiri, serif;
                font-weight: 700;
                font-style: normal;
                margin: auto;
                padding: auto;
                text-align: center;
                width: 207mm;
                height: 290mm;
             }
             .hiheader {
                line-height: 4mm;
             }
             .header {
                border: 3px solid black;
                border-radius: 25px;
                width: 190mm;
                text-align: center;
                margin: auto;
             }
             .decret p{
                font-size: 12px;
             }
    """)

    # Generate the PDF with custom CSS
    pdf_file = HTML(string=html_content).write_pdf(stylesheets=[custom_css])

    # Return the PDF as an HTTP response
    response = HttpResponse(pdf_file, content_type="application/pdf")
    response["Content-Disposition"] = f'attachment; filename="contract_{contrat_id}.pdf"'
    
    return response

