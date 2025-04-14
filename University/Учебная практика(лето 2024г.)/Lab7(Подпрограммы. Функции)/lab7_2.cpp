#include <iostream>

using namespace std;

// Функция для создания и заполнения матрицы
int** createMatrix(int m, int n) {
    int** matrix = new int* [m];
    for (int i = 0; i < m; ++i) {
        matrix[i] = new int[n];
    }

    cout << "Введите элементы матрицы:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> matrix[i][j];
        }
    }

    return matrix;
}

// Функция для вывода матрицы
void printMatrix(int** matrix, int m, int n) {
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

// Функция для перестановки строк в матрице
void swapRows(int** matrix, int m, int n) {
    for (int i = 0; i < m / 2; ++i) {
        for (int j = 0; j < n; ++j) {
            int temp = matrix[i][j];
            matrix[i][j] = matrix[m - 1 - i][j];
            matrix[m - 1 - i][j] = temp;
        }
    }
}

// Функция для освобождения памяти
void deleteMatrix(int** matrix, int m) {
    for (int i = 0; i < m; ++i) {
        delete[] matrix[i];
    }
    delete[] matrix;
}

int main() {
    // Ввод размера матрицы
    int m, n;
    cout << "Введите количество строк и столбцов матрицы:" << endl;
    cin >> m >> n;

    // Создание и заполнение матрицы
    int** matrix = createMatrix(m, n);

    // Вывод изначальной матрицы
    cout << "Введенная матрица:" << endl;
    printMatrix(matrix, m, n);

    // Перестановка строк в матрице
    swapRows(matrix, m, n);

    // Вывод новой матрицы
    cout << "Матрица после перестановки строк:" << endl;
    printMatrix(matrix, m, n);

    // Освобождение памяти
    deleteMatrix(matrix, m);

    return 0;
}