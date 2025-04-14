#include<iostream>

using namespace std;

void main() {
	//Инициализация переменных
	int arr1[10], count = 0, i;
	//Инициализация массива
	cout << "Введите 10 чисел для массива:";
	for (i = 0; i < 10; ++i) {
		cin >> arr1[i];
	}
	cout << "Изначальный массив: ";
	for (i = 0; i < 10; ++i) {
		cout << arr1[i] << " ";
	}
	cout << endl;
	//Работа с массивом
	for (i = 0; i < 10; ++i) {
		if (arr1[i] < 0) {
			count += 1;
		}
		if ((arr1[i] >= 0) && (arr1[i] <= 10)) {
			arr1[i] = arr1[i] * 3;
		}
	}
	//Вывод
	cout << "Количество отрицательных элементов: " << count << endl;
	cout << "Измененный массив: ";
	for (i = 0; i < 10; ++i) {
		cout << arr1[i] << " ";
	}
}