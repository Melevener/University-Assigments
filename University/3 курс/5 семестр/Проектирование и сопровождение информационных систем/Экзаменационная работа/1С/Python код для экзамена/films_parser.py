import requests
from bs4 import BeautifulSoup
import locale
import re
import csv

locale.setlocale(locale.LC_ALL, "ru_RU.UTF-8")

url = "https://www.kinoafisha.info/rating/movies/"

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
}

response = requests.get(url, headers=headers)

if response.status_code == 200:
    soup = BeautifulSoup(response.content, "html.parser")

    film_blocks = soup.find_all("div", class_="movieItem")
    if not film_blocks:
        print("Не найдены блоки фильмов. Проверьте структуру HTML.")
    else:
        films = []

        for block in film_blocks:
            name = block.find('a', class_='movieItem_title')
            year_country = block.find('span', class_='movieItem_year')
            genres = block.find('span', class_='movieItem_genres')

            if name and year_country and genres:
                name = name.get_text(strip=True)
                year_country = year_country.get_text(strip=True)
                genres = genres.get_text(strip=True).split(',')[0].strip().capitalize()

                year = None
                country = None
                match = re.match(r"(\d{4}), (.+)", year_country)
                if match:
                    year = match.group(1)
                    country = match.group(2).split('/')[0].strip()
                else:
                    match = re.match(r"(\d{4})", year_country)
                    if match:
                        year = match.group(1)

                films.append({
                    'name': name,
                    'year': year,
                    'country': country,
                    'genres': genres,
                })
            else:
                print("Некоторые данные отсутствуют в блоке фильма.")

        with open('films.csv', 'w', newline='', encoding='utf-8') as csvfile:
            fieldnames = ['name', 'year', 'country', 'genres']
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

            writer.writeheader()
            for film in films:
                writer.writerow(film)

else:
    print(f"Ошибка при запросе страницы: {response.status_code}")
