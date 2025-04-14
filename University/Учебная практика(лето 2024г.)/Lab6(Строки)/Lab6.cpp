#include<iostream>
#include<string>
#include<algorithm>

using namespace std;

void main() {
	//Инициализация последовательности строк
	string words[10];
	//Ввод слов
	cout << "Введите 10 пятибуквенных слов:" << endl;
	for (int i = 0; i < 10; ++i) {
		cin >> words[i];
		if (words[i].length() != 5) {
			cout << "Вы ввели не пятибуквенное слово!!!" << endl;
		}
	}
	//Сортировка с помощью библиотеки алгоритмов
	sort(words, words + 10);
	//Вывод отсортированной последовательности
	for (int i = 0; i < 10; ++i) {
		cout << words[i] << " ";
	}
}