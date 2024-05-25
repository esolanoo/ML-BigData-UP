from django.shortcuts import render
from .models import Student, Class, Questions, Answer, Attendance, Quiz, Choices
from .forms import StudentForm, ClassForm, QuestionsForm, AnswerForm, AttendanceForm
from django.shortcuts import get_object_or_404


global exam_questions 
exam_questions = ["Which SQL statement is used to retrieve data from a database?", 
                "What is the correct SQL statement to create a database named test_db?",
                "Which of the following is a valid data type in MySQL?",
                "What is the main purpose of an index in a database?",
                "Which SQL keyword is used to combine rows from two or more tables, based on a related column between them?",
                "Which SQL function is used to calculate the number of rows in a table?"]


def main_page(request):
    return render(request, 'home.html')

def error_page(request):
    return render(request, 'error.html')


def view_student_data(request):
    model = Student.objects.all()
    return render(request, 'students_data.html', {'students': model})

def view_class_data(request):
    model = Class.objects.all()
    return render(request, 'class_data.html', {'classes': model})

def view_question_data(request):
    model = Questions.objects.all()
    classes = Class.objects.all()
    return render(request, 'questions_data.html', {'questions': model,
                                                   'classes': classes})

def view_answer_data(request):
    model = Answer.objects.all()
    students = Student.objects.all()
    questions = Questions.objects.all()
    return render(request, 'answers_data.html', {'answers': model,
                                                'students': students,
                                                'questions': questions})

def view_attendance_data(request):
    model = Attendance.objects.all()
    classes = Class.objects.all()
    students = Student.objects.all()
    return render(request, 'attendances_data.html', {'attendances': model,
                                                    'classes': classes,
                                                    'students': students})


def add_student(request):
    if request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'added.html')
        return render(request, 'error.html')
    
def add_class(request):
    if request.method == 'POST':
        form = ClassForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'added.html')
        else:
            return render(request, 'error.html')

def add_question(request):
    if request.method == 'POST':
        class_number = int(request.POST.get('class_number'))
        class_instance = get_object_or_404(Class, class_number=class_number)
        question = request.POST.get('question')
        model = Questions(question = question)
        model.class_number = class_instance
        model.save()
        return render(request, 'added.html')

def add_answer(request):
    if request.method == 'POST':
        combined_value = request.POST.get('class_number')
        class_number, question = combined_value.split('|')
        class_number = int(class_number.split(':')[0])
        student_ids = [student.id for student in Student.objects.all()]
        for student_id in student_ids:
            answer = request.POST.get(f'answer_{student_id}')
            model = Answer(given_answer = answer)
            class_instance = get_object_or_404(Class, class_number=class_number)
            model.class_number = class_instance
            class_instance = get_object_or_404(Student, id=student_id)
            model.student_id = class_instance
            class_instance = get_object_or_404(Questions, question=question)
            model.question = class_instance
            model.save()
        return render(request, 'added.html')

def add_attendance(request):
    if request.method == 'POST':
        class_number = int(request.POST.get('class_number'))
        student_ids = [student.id for student in Student.objects.all()]
        for student_id in student_ids:
            attendance = request.POST.get(f'student_attendance_{student_id}') == 'True'
            model = Attendance(attendance = attendance)
            class_instance = get_object_or_404(Class, class_number=class_number)
            model.class_number = class_instance
            class_instance = get_object_or_404(Student, id=student_id)
            model.student_id = class_instance
            model.save()
        return render(request, 'added.html')
    
def show_grades(request):
    model = Quiz.objects.all()
    students = Student.objects.all()
    choices = Choices.objects.all()
    questions = exam_questions
    return render(request, 'show_grades.html', {'quizes': model,
                                                'students': students,
                                                'choices': choices,
                                                'questions': questions})

def do_exam(request):
    if request.method == 'POST':
        answers = [request.POST.get(question) for question in exam_questions]
        student_id =request.POST.get('student_id')
        class_instance = get_object_or_404(Student, id=student_id)
        model = Quiz(student_id = class_instance)
        model.question1=exam_questions[0]
        model.question2=exam_questions[1]
        model.question3=exam_questions[2]
        model.question4=exam_questions[3]
        model.question5=exam_questions[4]
        model.question6=exam_questions[5]
        model.answer1=answers[0] == 'True'
        model.answer2=answers[1] == 'True'
        model.answer3=answers[2] == 'True'
        model.answer4=answers[3] == 'True'
        model.answer5=answers[4] == 'True'
        model.answer6=answers[5] == 'True'
        model.save()
        return render(request, 'added.html')





