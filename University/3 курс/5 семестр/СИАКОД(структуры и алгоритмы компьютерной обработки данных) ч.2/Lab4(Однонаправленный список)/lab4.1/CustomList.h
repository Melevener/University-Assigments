#include<iostream>
#include<cstdlib>
#include<ctime>

struct Node {
	int data;
	Node* next;
};

class LinkedList {
private:
	Node* head;
	int length;

public:
	//Конструктор
	LinkedList() {
		//Создаём барьерный элемент(голова списка)
		head = new Node();
		//Барьерный элемент, не используется для данных
		head->data = 0;
		head->next = nullptr;
		length = 0;
	}

	//Деструктор
	~LinkedList() {
		Node* current = head;
		while (current != nullptr) {
			Node* temp = current;
			current = current->next;
			delete temp;
		}
		length = 0;
	}

	//Заполнение списка(состоит из 2 подпрограмм)
	//Собственно сама вставка элемента
	void insertElement(int value) {
		Node* newNode = new Node();
		newNode->data = value;
		newNode->next = head->next;
		head->next = newNode;
		++length;
	}

	//Создание случайного элемента в диапазоне [-250, 250] для последующего добавления
	void fillListRandom(int numelements) {
		srand(time(0));
		for (int i = 0; i < numelements; ++i) {
			int randomValue = rand() % 501 - 250;
			insertElement(randomValue);
		}
	}

	//Печать элементов списка в порядке их расположения
	void printList() const {
		Node* current = head->next;
		while (current != nullptr) {
			std::cout << current->data << " ";
			current = current->next;
		}
		std::cout << std::endl;
	}

	int getLength() const {
		return length;
	}

	//Вставка после i-того элемента
	void insertElementAfter(int index, int value) {
		Node* current = head->next;
		int count = 0;

		while (current != nullptr && count < index) {
			current = current->next;
			++count;
		}

		if (current != nullptr) {
			Node* newNode = new Node();
			newNode->data = value;
			newNode->next = current->next;
			current->next = newNode;
			++length;
		}
		else {
			std::cout << "Индекс за пределами списка!" << std::endl;
		}
	}
};