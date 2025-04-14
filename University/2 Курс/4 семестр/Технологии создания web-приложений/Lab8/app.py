from flask import Flask, request, redirect, url_for, send_from_directory, render_template, flash
import os
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from flask_wtf import FlaskForm
from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField, TextAreaField, DateField, SelectField, PasswordField, BooleanField
from wtforms.validators import DataRequired, Length, Email, EqualTo
from werkzeug.security import generate_password_hash, check_password_hash
from config import Config
from models import db, User, Task


app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
migrate = Migrate(app, db)

login_manager = LoginManager(app)
login_manager.login_view = 'login'

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# Формы
class TaskForm(FlaskForm):
    task_title = StringField('Название задачи', validators=[DataRequired()])
    subject = StringField('Название предмета', validators=[DataRequired()])
    description = TextAreaField('Подробное описание задачи', validators=[DataRequired()])
    deadline = DateField('Срок сдачи', validators=[DataRequired()])
    status = SelectField('Статус выполнения', choices=[('not_started', 'Не начато'), ('in_progress', 'В процессе'), ('completed', 'Завершено')], validators=[DataRequired()])

class RegistrationForm(FlaskForm):
    username = StringField('Имя пользователя', validators=[DataRequired(), Length(min=2, max=150)])
    email = StringField('Электронная почта', validators=[DataRequired(), Email()])
    password = PasswordField('Пароль', validators=[DataRequired()])
    confirm_password = PasswordField('Подтвердите пароль', validators=[DataRequired(), EqualTo('password')])

class LoginForm(FlaskForm):
    email = StringField('Электронная почта', validators=[DataRequired(), Email()])
    password = PasswordField('Пароль', validators=[DataRequired()])
    remember = BooleanField('Запомнить меня')

class FileUploadForm(FlaskForm):
    file = FileField('Файл', validators=[DataRequired()])

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'png', 'jpg', 'jpeg', 'gif'}

def translate_status(status):
    translations = {
        "in_progress": "в процессе",
        "completed": "завершено",
        "not_started": "не начато"
    }
    return translations.get(status, status)

if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

@app.route('/')
@login_required
def home():
    tasks = Task.query.filter_by(user_id=current_user.id).all()
    for task in tasks:
        task.status = translate_status(task.status)
    return render_template('index.html', tasks=tasks)

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
@login_required
def task_form():
    form = TaskForm()
    if form.validate_on_submit():
        task = Task(
            task_title=form.task_title.data,
            subject=form.subject.data,
            description=form.description.data,
            deadline=form.deadline.data,
            status=form.status.data,
            user_id=current_user.id
        )
        db.session.add(task)
        db.session.commit()
        flash('Задача создана', 'success')
        return redirect(url_for('home'))
    return render_template('form.html', form=form)

@app.route('/submit', methods=['GET', 'POST'])
def submit():
    return redirect(url_for('home'))

@app.route('/choice/<subject>')
def choice(subject):
    return render_template('choice.html', subject=subject)

@app.route('/archive/<name>/<int:number1>/<string:str2>')
def archive(name, number1, str2):
    return render_template('archive.html', name=name, number1=number1, str2=str2)

@app.route('/upload', methods=['GET', 'POST'])
@login_required
def upload_file():
    form = FileUploadForm()
    uploaded_filename = None
    if form.validate_on_submit():
        if 'file' not in request.files:
            flash('Файл не выбран', 'danger')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('Файл не выбран', 'danger')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = file.filename
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
            uploaded_filename = filename
            flash('Файл загружен', 'success')
            return render_template('upload.html', form=form, uploaded_filename=uploaded_filename)
    return render_template('upload.html', form=form, uploaded_filename=uploaded_filename)

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

@app.route('/gallery')
def gallery():
    return render_template('gallery.html')

@app.route('/registration', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = generate_password_hash(form.password.data, method='pbkdf2:sha256')
        user = User(username=form.username.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('Регистрация прошла успешно', 'success')
        return redirect(url_for('login'))
    return render_template('registration.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and check_password_hash(user.password, form.password.data):
            login_user(user, remember=form.remember.data)
            return redirect(url_for('home'))
        else:
            flash('Неверный email или пароль', 'danger')
    return render_template('login.html', form=form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Вы вышли из системы', 'success')
    return redirect(url_for('login'))

@app.route('/delete_task/<int:task_id>', methods=['POST'])
@login_required
def delete_task(task_id):
    task = Task.query.get_or_404(task_id)
    if task.user_id != current_user.id:
        flash('Вы не можете удалить это задание.', 'danger')
        return redirect(url_for('home'))
    db.session.delete(task)
    db.session.commit()
    flash('Задание удалено.', 'success')
    return redirect(url_for('home'))

@app.route('/edit_task/<int:task_id>', methods=['GET', 'POST'])
@login_required
def edit_task(task_id):
    task = Task.query.get_or_404(task_id)
    if task.user_id != current_user.id:
        flash('Вы не можете изменить это задание.', 'danger')
        return redirect(url_for('home'))
    
    form = TaskForm(obj=task)
    if form.validate_on_submit():
        task.task_title = form.task_title.data
        task.subject = form.subject.data
        task.description = form.description.data
        task.deadline = form.deadline.data
        task.status = form.status.data
        db.session.commit()
        flash('Задание обновлено.', 'success')
        return redirect(url_for('home'))
    return render_template('edit_task.html', form=form, task_id=task_id)

if __name__ == '__main__':
    app.run(debug=True)
