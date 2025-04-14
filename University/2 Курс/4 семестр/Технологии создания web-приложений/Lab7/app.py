from flask import Flask, request, redirect, url_for, send_from_directory, render_template
import os
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, DateField, SelectField
from wtforms.validators import DataRequired

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key_here'
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

class TaskForm(FlaskForm):
    task_title = StringField('Название задачи', validators=[DataRequired()])
    subject = StringField('Название предмета', validators=[DataRequired()])
    description = TextAreaField('Подробное описание задачи', validators=[DataRequired()])
    deadline = DateField('Срок сдачи', validators=[DataRequired()])
    status = SelectField('Статус выполнения', choices=[('not_started', 'Не начато'), ('in_progress', 'В процессе'), ('completed', 'Завершено')], validators=[DataRequired()])

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/image')
def image():
    return render_template('image.html')

@app.route('/bootstrap')
def bootstrap():
    return render_template('bootstrap.html')

@app.route('/form', methods=['GET', 'POST'])
def task_form():
    form = TaskForm()
    if form.validate_on_submit():
        task_title = form.task_title.data
        subject = form.subject.data
        description = form.description.data
        deadline = form.deadline.data
        status = form.status.data
        return redirect(url_for('submit', task_title=task_title, subject=subject, description=description, deadline=deadline, status=status))
    return render_template('form.html', form=form)

@app.route('/submit', methods=['GET', 'POST'])
def submit():
    if request.method == 'POST':
        task_title = request.form.get('task_title')
        subject = request.form.get('subject')
        description = request.form.get('description')
        deadline = request.form.get('deadline')
        status = request.form.get('status')
        return render_template('submit.html', task_title=task_title, subject=subject, description=description, deadline=deadline, status=status)
    else:
        return redirect(url_for('home'))

@app.route('/choice/<subject>')
def choice(subject):
    return render_template('choice.html', subject=subject)

@app.route('/archive/<name>/<int:number1>/<string:str2>')
def archive(name, number1, str2):
    return render_template('archive.html', name=name, number1=number1, str2=str2)

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            return redirect(request.url)
        file = request.files['file']

        if file.filename == '':
            return redirect(request.url)

        if file and allowed_file(file.filename):
            filename = file.filename
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('uploaded_file', filename=filename))
    return render_template('upload.html')

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

@app.route('/gallery')
def gallery():
    return render_template('gallery.html')

if __name__ == '__main__':
    app.run(debug=True)
