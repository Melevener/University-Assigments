from flask import Flask, request, redirect, url_for, send_from_directory
import os

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/')
def home():
    return """
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Дневник Студента</title>
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Это основная страница приложения "Дневник студента"</h1>
        </div>
    </body>
    </html>
    """

@app.route('/about')
def about():
    return """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>О приложении</title>
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>О Дневнике Студента</h1>
            <p>Добро пожаловать в приложение "Дневник Студента"! Это приложение поможет студентам отслеживать свои учебные заметки, ставить цели на семестр и отслеживать свой прогресс в учебе.</p>
            <p>Наша цель - предоставить эффективный и организованный способ для студентов управлять своим образовательным процессом.</p>
        </div>
    </body>
    </html>
    """

@app.route('/image')
def image():
    return """
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Страница с изображением</title>
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Заголовок страницы с изображением</h1>
            <img src="/static/images/pic1.png" alt="Пример изображения">
            <p>Подпись под изображением: Это пример изображения для страницы.</p>
        </div>
    </body>
    </html>
    """

@app.route('/bootstrap')
def bootstrap():
    return """
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap Компоненты</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="mb-4">Пример Bootstrap Компонентов</h1>
            <blockquote class="blockquote">
                <p class="mb-0">Образование - это то, что остается после того, как забывается все выученное в школе.</p>
                <footer class="blockquote-footer">Альберт Эйнштейн</footer>
            </blockquote>

            <div class="card mt-4" style="width: 18rem;">
                <img src="/static/images/pic1.png" alt="Пример изображения">
                <div class="card-body">
                    <h5 class="card-title">Дневник Студента</h5>
                    <p class="card-text">Наше приложение "Дневник Студента" помогает студентам организовывать учебные заметки, ставить цели на семестр и отслеживать свой прогресс. Пользуйтесь приложением, чтобы улучшить свои академические результаты и достичь поставленных целей!</p>
                    <a href="#" class="btn btn-primary">Узнать больше</a>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    </html>
    """
@app.route('/form')
def task_form():
    return """
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Создание задачи</title>
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="mb-4">Создание задачи</h1>
            <form action="/submit" method="post">
                <div class="form-group">
                    <label for="task_title">Название задачи:</label>
                    <input type="text" id="task_title" name="task_title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Название предмета:</label>
                    <input type="text" id="subject" name="subject" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Подробное описание задачи:</label>
                    <textarea id="description" name="description" class="form-control" rows="4" required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="deadline">Срок дедлайна:</label>
                    <input type="date" id="deadline" name="deadline" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="status">Статус выполнения:</label>
                    <select id="status" name="status" class="form-control" required>
                        <option value="not_started">Не начато</option>
                        <option value="in_progress">В процессе</option>
                        <option value="completed">Завершено</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary">Создать задачу</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    </html>
    """

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
        else:
            return "Неподдерживаемый тип файла"
    else:
        return """
        <!DOCTYPE html>
        <html lang="ru">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="/static/css/style.css">
            <title>Загрузка файла</title>
        </head>
        <body>
            <h1>Загрузка файла</h1>
            <form action="/upload" method="post" enctype="multipart/form-data">
                <input type="file" name="file">
                <input type="submit" value="Загрузить">
            </form>
        </body>
        </html>
        """
    
@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

@app.route('/gallery')
def gallery():
    return """
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Галерея</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Галерея</h1>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="/static/images/crs1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/static/images/crs2.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/static/images/crs3.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/static/images/crs4.jpg" alt="Fourth slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/static/images/pic.png" alt="Fifth slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(debug=True)