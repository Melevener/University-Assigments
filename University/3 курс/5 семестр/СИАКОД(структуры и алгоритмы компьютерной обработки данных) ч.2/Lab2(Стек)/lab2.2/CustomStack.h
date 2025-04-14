#include <iostream>
#include <string>

struct String {
	std::string text;
};

struct Node {
	String data;
	Node* next;
};

class Stack {
private:
	Node* top;

public:
	Stack() : top(nullptr) {};
	~Stack() {
		while (!isEmpty()) {
			pop();
		}
	}

	void push(std::string text) {
		Node* newNode = new Node();
		newNode->data = { text };
		newNode->next = top;
		top = newNode;

	}

	void pop() {
		if (isEmpty()) {
			std::cout << "Стек пуст, нечего удалять. \n";
			return;
		}
		Node* temp = top;
		top = top->next;
		delete temp;
	}

	bool isEmpty() {
		return top == nullptr;
	}

	std::string topElement() {
		if (isEmpty()) {
			std::cout << "Стек пуст.\n";
			return "";
		}
		return top->data.text;
	}
};
