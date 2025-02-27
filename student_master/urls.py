from django.urls import path
from .views import *
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [    
    
    path('', auth_views.LoginView.as_view(template_name='registration/login.html'), name='login'),
    path('logout/', views.logout, name='logout'),
    path('home/', views.home, name='home'),
    path('diploma/<int:id>/', views.diploma, name='diploma'),
    path('transcript/<int:id>', views.transcript, name='transcript'),
    path('certificate/<int:id>/', views.certificate, name='certificate'),
    path('conduct/<int:id>', views.conduct, name='conduct'),
    
    # Make sure this comes before any other patterns that might conflict
    path('password_reset/', 
         auth_views.PasswordResetView.as_view(template_name='registration/password_reset.html'), 
         name='password_reset'),

    path('password_reset_sent/', 
         auth_views.PasswordResetDoneView.as_view(template_name='registration/password_reset_sent.html'), 
         name='password_reset_done'),

    path('reset/<uidb64>/<token>/', 
         auth_views.PasswordResetConfirmView.as_view(template_name='registration/password_reset_form.html'), 
         name='password_reset_confirm'),

    path('password_reset_complete/', 
         auth_views.PasswordResetCompleteView.as_view(template_name='registration/password_reset_complete.html'), 
         name='password_reset_complete'),
   
      # Department URLs
    path('domains/', views.domain_list, name='domain_list'),
    path('domains/add/', views.domain_add, name='domain_add'),
    path('domains/edit/<int:id>/', views.domain_edit, name='domain_edit'),
    path('domains/delete/<int:id>/', views.domain_delete, name='domain_delete'),
    path('domains/<int:id>/data/', views.domain_data, name='domain_data'),

    path('students/', views.student_list, name='student_list'),
    path('students/add/', views.student_add, name='student_add'), 
    path('students/edit/<int:student_id>/', views.student_edit, name='student_edit'),
    path('students/delete/<int:id>/', views.student_delete, name='student_delete'),    path('students/<int:id>/data/', views.student_data, name='student_data'),
    path('students/import_csv/', views.student_import_csv, name='student_import_csv'),
    
    path('contrats/', views.student_contrat_list, name='student_contrat_list'),
    path('contrats/add/', views.student_contrat_add, name='student_contrat_add'),
    path("contrats/edit/<int:contrat_id>/", views.student_contrat_edit, name="student_contrat_edit"),  
    path('contrats/delete/<int:id>/', views.student_contrat_delete, name='student_contrat_delete'),
    path('contrats/<int:id>/data/', views.student_contrat_data, name='student_contrat_data'),  # Correction ici
    
    path("import-student-contrats/", views.import_student_contrats, name="import_student_contrats"),
    path('contrat/<int:id>', views.contract, name='contrat'),

    path("send-contracts-email/", send_contracts_email, name="send_contracts_email"),
    path("contrat/pdf/<int:contrat_id>/", generate_contract_pdf, name="generate_contract_pdf"),
    
    # Filiere URLs
    path('filieres/', views.filiere_list, name='filiere_list'),
    path('filieres/add/', views.filiere_add, name='filiere_add'),
    path('filieres/edit/<int:id>/', views.filiere_edit, name='filiere_edit'),
    path('filieres/delete/<int:id>/', views.filiere_delete, name='filiere_delete'),
    path('filieres/<int:id>/data/', views.filiere_data, name='filiere_data'),

    path('specialities/', views.speciality_list, name='speciality_list'),
    path('specialities/add/', views.speciality_add, name='speciality_add'),
    path('specialities/edit/<int:id>/', views.speciality_edit, name='speciality_edit'),
    path('specialities/delete/<int:id>/', views.speciality_delete, name='speciality_delete'),

    path('unities/', views.unity_list, name='unity_list'),
    path('unities/add/', views.unity_add, name='unity_add'),
    path('unities/edit/<int:id>/', views.unity_edit, name='unity_edit'),
    path('unities/delete/<int:id>/', views.unity_delete, name='unity_delete'),
    path('unities/<int:id>/data/', views.unity_data, name='unity_data'),

    path('subjects/', views.subject_list, name='subject_list'),
    path('subjects/add/', views.subject_add, name='subject_add'),
    path('subjects/edit/<int:id>/', views.subject_edit, name='subject_edit'),
    path('subjects/delete/<int:id>/', views.subject_delete, name='subject_delete'),
    
    path('deliberations/', deliberation_list, name='deliberation_list'),
    path('deliberations/add/', deliberation_add, name='deliberation_add'),
    path('deliberations/edit/<int:id>/', deliberation_edit, name='deliberation_edit'),
    path('deliberations/delete/<int:id>/', deliberation_delete, name='deliberation_delete'),
    path('get-student-data/', views.get_student_data, name='get_student_data'),
    path('deliberations/<int:id>/data/', views.deliberation_data, name='deliberation_data'),
    
    path('get_students_by_speciality/', views.get_students_by_speciality, name='get_students_by_speciality'),
    path('issue_diploma/<int:id>/', views.issue_diploma, name='issue_diploma'),
    path('issue_transcript/<int:id>/', views.issue_transcript, name='issue_transcript'),
    path('enrollments/issue_badge/<int:id>/', views.issue_badge, name='issue_badge'),

    path('enrollments/', views.enrollment_list, name='enrollment_list'),
    path('enrollments/add/', views.enrollment_add, name='enrollment_add'),
    path('enrollments/edit/<int:id>/', views.enrollment_edit, name='enrollment_edit'),
    path('enrollments/delete/<int:id>/', views.enrollment_delete, name='enrollment_delete'),
    
    path('grades/', views.grade_list, name='grade_list'), 
    path('grades/create/', views.grade_create, name='grade_create'),
    path('grades/edit/<int:grade_id>/', views.grade_edit, name='grade_edit'),
    path('grades/delete/<int:id>/', views.grade_delete, name='grade_delete'),
    
    path('get_students_and_subjects/', views.get_students_and_subjects, name='get_students_and_subjects'),


    path('memoires/', memoire_list, name='memoire_list'),
    path('memoires/add/', memoire_add, name='memoire_add'),
    path('memoires/edit/<int:id>/', memoire_edit, name='memoire_edit'),
    path('memoires/delete/<int:id>/', memoire_delete, name='memoire_delete'),
    path('upload-memoire-file/', upload_memoire_file, name='upload_memoire_file'),
]   
     