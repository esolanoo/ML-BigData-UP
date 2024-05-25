from django.db import models
from django.utils import timezone
import numpy as np

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
    
class Quiz(models.Model):
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='quizzes')
    question1 = models.CharField(max_length=255)
    question2 = models.CharField(max_length=255)
    question3 = models.CharField(max_length=255)
    question4 = models.CharField(max_length=255)
    question5 = models.CharField(max_length=255)
    question6 = models.CharField(max_length=255)
    answer1 = models.BooleanField(default=False)
    answer2 = models.BooleanField(default=False)
    answer3 = models.BooleanField(default=False)
    answer4 = models.BooleanField(default=False)
    answer5 = models.BooleanField(default=False)
    answer6 = models.BooleanField(default=False)
    
    def __str__(self):
        return f'{[self.answer1, self.answer2, self.answer3, self.answer4, self.answer5, self.answer6].count(True)}/6'
    
class Choices(models.Model):
    question = models.TextField()
    choice = models.TextField()
    correct = models.BooleanField(default=False)
    
    def __str__(self):
        return f'{self.choice}'


