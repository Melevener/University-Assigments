#include<iostream>
#include<cmath>

using namespace std;

int main() {
	//Инициализация переменных
	double a, b, M, fraction, term, sum, res1, res2;
	int count_terms;
	M = 0.4342944819032518;
	//Ввод значений
	cout << "Введите значение a(>0):";
	cin >> a;
	cout << "Введите значение b(>0):";
	cin >> b;
	//Проверка значений
	if (a <= 0 || b <= 0) {
		cout << "Значения a и b должны быть больше 0!!!" << endl;
		return 1;
	}
	//Вычисление дроби b/(2a + b)
	fraction = b / (2 * a + b);
	sum = 0.0;
	//Цикл для приблизительного вычисления функции
	int n = 1;
	while (true) {
		int exp = 2 * n - 1;
		term = (1.0 / exp) * pow(fraction, exp);
		if (fabs(term) < 1e-10) {
			break;
		}
		sum += term;
		n++;
	}
	//Вычисление приближенного значения 
	res1 = log10(a) + 2 * M * sum;
	res2 = log10(a + b);
	//Вывод результатов
	cout << "Приближенное значение lg(a+b):" << res1 << endl;
	cout << "Точное значение lg(a+b):" << res2;

	return 0;
}