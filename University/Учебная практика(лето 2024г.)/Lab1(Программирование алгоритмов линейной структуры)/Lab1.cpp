#include<iostream>
#include<cmath>

using namespace std;
void main() {
	//Инициализация переменных
	double A, B, C, D, s1, s2, Y;
	//Ввод значений
	cout << "Введите значения переменных A, B, C, D:" << endl;
	cin >> A >> B >> C >> D;
	//Вычисление значения
	s1 = (A / B) - 1;
	s2 = (C / D) - 1;
	Y = pow(s1 / s2, 2);
	cout << "Искомое значение Y:" << Y;
}
