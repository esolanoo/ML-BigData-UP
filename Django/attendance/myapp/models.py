from django.db import models
from django.utils import timezone

class Student(models.Model):
    id = models.CharField(max_length=10, primary_key=True)
    name = models.CharField(max_length = 100)
    last_names = models.CharField(max_length = 100)
    alias = models.CharField(max_length = 50)

    def __str__(self):
        return f'{self.last_names}, {self.name}'

class Class(models.Model):
    class_number = models.PositiveSmallIntegerField()
    topic = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f'{self.class_number}: {self.topic}'

class Questions(models.Model):
    class_number = models.ForeignKey(Class, on_delete=models.CASCADE, related_name='questions')
    question = models.TextField()
    
    def __str__(self):
        return self.question
    
class Answer(models.Model):
    class_number = models.ForeignKey(Class, on_delete=models.CASCADE, related_name='answers')
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='answers')
    question = models.ForeignKey(Questions, on_delete=models.CASCADE, related_name='answers')
    given_answer = models.TextField()
    
    def __str__(self):
        return self.given_answer
    
class Attendance(models.Model):
    class_number = models.ForeignKey(Class, on_delete=models.CASCADE, related_name='attendances')
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='attendances')
    attendance = models.BooleanField(default=False)
    
    def __str__(self):
        return f'{self.class_number}: {self.student_id} - {self.attendance}'
