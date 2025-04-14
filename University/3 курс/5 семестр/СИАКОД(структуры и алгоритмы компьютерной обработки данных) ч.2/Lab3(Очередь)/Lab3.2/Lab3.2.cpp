#include"CustomQueue.h"
#include<iostream>
#include<cmath>

int main() {
	setlocale(LC_ALL, "Russian");
	Queue que2;
	double sum = 0.0;

	que2.enqueue(2.2);
	que2.enqueue(3.2);
	que2.enqueue(2.4);
	que2.enqueue(-3.2);

	//Удаление элемента из очереди
	que2.dequeue();

	que2.enqueue(0.04);

	//Сумма
	while (!que2.isEmpty()) {
		double headValue = que2.getHead();
		std::cout << "Элемент очереди : " << headValue << std::endl;
		if (abs(headValue) > 1) {
			sum += headValue;
		}
		que2.dequeue();
	}

	std::cout << "Сумма элементов очереди: " << sum << std::endl;
}