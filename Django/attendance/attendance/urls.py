"""
URL configuration for attendance project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.main_page, name='home'),
    path('error/', views.error_page, name='error'),
    path('view_student_data/', views.view_student_data, name='view_student_data'),
    path('view_class_data/', views.view_class_data, name='view_class_data'),
    path('view_question_data/', views.view_question_data, name='view_question_data'),
    path('view_answer_data/', views.view_answer_data, name='view_answer_data'),
    path('view_attendance_data/', views.view_attendance_data, name='view_attendance_data'),
    path('add_student/', views.add_student, name='add_student'),
    path('add_class/', views.add_class, name='add_class'),
    path('add_question/', views.add_question, name='add_question'),
    path('add_answer/', views.add_answer, name='add_answer'),
    path('add_attendance/', views.add_attendance, name='add_attendance'),
    path('show_grades/', views.show_grades, name='show_grades'),
    path('do_exam/', views.do_exam, name='do_exam'),
]
