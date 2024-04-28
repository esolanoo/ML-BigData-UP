from django import forms
from .models import Student, Class, Questions, Answer, Attendance

class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = '__all__'  # Use all fields from the Student model

class ClassForm(forms.ModelForm):
    class Meta:
        model = Class
        fields = '__all__'

class QuestionsForm(forms.ModelForm):
    class Meta:
        model = Questions
        fields = '__all__'

class AnswerForm(forms.ModelForm):
    class Meta:
        model = Answer
        fields = '__all__'

class AttendanceForm(forms.ModelForm):
    class Meta:
        model = Attendance
        fields = '__all__'
