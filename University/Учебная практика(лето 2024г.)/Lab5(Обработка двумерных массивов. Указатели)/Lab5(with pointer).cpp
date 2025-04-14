//#include<iostream>
//
//using namespace std;
//
//void swapElements(int& a, int& b) {
//	int temp = a;
//	a = b;
//	b = temp;
//}
//
//void main() {
//	//Ввод размера матрицы
//	int m, n;
//	cout << "Введите количество строк и столбцов матрицы:" << endl;
//	cin >> m >> n;
//	//Динамическое выделение памяти для матрицы
//	int** matrix = new int* [m];
//	for (int i = 0; i < m; ++i) {
//		matrix[i] = new int[n];
//	}
//	//Заполнение массива значениями
//	cout << "Введите элементы матрицы:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cin >> matrix[i][j];
//		}
//	}
//	//Вывод изначальной матрицы
//	cout << "Введенная матрица:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cout << matrix[i][j] << " ";
//		}
//		cout << endl;
//	}
//	//Перестановка строк в матрице
//	for (int i = 0; i < m / 2; ++i) {
//		for (int j = 0; j < n; ++j) {
//			swapElements(matrix[i][j], matrix[m - 1 - i][j]);
//		}
//	}
//	//Вывод новой матрицы
//	cout << "Матрица после перестановки строк:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cout << matrix[i][j] << " ";
//		}
//		cout << endl;
//	}
//	//Освобождение памяти
//	for (int i = 0; i < m; ++i) {
//		delete[] matrix[i];
//	}
//	delete[] matrix;
//}
//
//
