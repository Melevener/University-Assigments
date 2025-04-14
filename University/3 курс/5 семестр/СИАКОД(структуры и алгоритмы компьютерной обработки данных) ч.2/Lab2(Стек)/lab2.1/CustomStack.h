#include <iostream>
#include <string>

struct Book {
	std::string title;
	int pages;
};

struct Node {
	//Данные элемента
	Book data;
	//Указатель на следующий элемент
	Node* next;
};

class Stack {
private:
	//Указатель на вершину стека
	Node* top;

public:
	//Конструктор
	Stack() : top(nullptr) {};
	//Деструктор
	~Stack() {
		while (!isEmpty()) {
			pop();
		}
	}
	//Добавление элемента в стек
	void push(std::string title ,int pages) {
		Node* newNode = new Node();
		newNode->data = {title, pages};
		newNode->next = top;
		top = newNode;
	}

	//Удаление элемента из стека
	void pop() {
		if (isEmpty()) {
			std::cout << "Стек пуст, нечего удалять. \n";
			return;
		}
		Node* temp = top;
		top = top->next;
		delete temp;
	}

	//Проверка на пустоту
	bool isEmpty() {
		return top == nullptr;
	}

	int count() {
		int count = 0;
		Node* current = top;
		while (current != nullptr) {
			count++;
			current = current->next;
		}
		return count;
	}
};