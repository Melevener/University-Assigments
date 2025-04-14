#include <iostream>
#include "CustomStack.h"

int main() {
	setlocale(LC_ALL, "Russian");
	//Инициализируем стек с книгами
	Stack books;

	//Добавляем в нее книги
	books.push("To Kill a Mockingbird", 281);
	books.push("Pride and Prejudice", 279);
	books.push("The Great Gatsby", 180);
	books.push("The Lord of the Rings", 1178);
	books.push("I, robot", 317);

	//Выводим количество книг
	std::cout << "Количество книг в стеке:" << books.count() << std::endl;
}
