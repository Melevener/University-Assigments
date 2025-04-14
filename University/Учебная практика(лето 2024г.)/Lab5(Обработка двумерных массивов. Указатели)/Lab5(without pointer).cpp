#include <iostream>
#include <vector>

using namespace std;

void main() {
    // Ввод размера матрицы
    int m, n;
    cout << "Введите количество строк и столбцов матрицы:" << endl;
    cin >> m >> n;

    // Создание матрицы с помощью vector
    vector<vector<int>> matrix(m, vector<int>(n));


    // Заполнение массива значениями
    cout << "Введите элементы матрицы:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> matrix[i][j];
        }
    }

    // Вывод изначальной матрицы
    cout << "Введенная матрица:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }

    // Перестановка строк в матрице
    for (int i = 0; i < m / 2; ++i) {
        for (int j = 0; j < n; ++j) {
            int temp = matrix[i][j];
            matrix[i][j] = matrix[m - 1 - i][j];
            matrix[m - 1 - i][j] = temp;
        }
    }

    // Вывод новой матрицы
    cout << "Матрица после перестановки строк:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}