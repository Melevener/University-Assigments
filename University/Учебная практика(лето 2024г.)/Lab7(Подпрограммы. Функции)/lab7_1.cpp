//#include <iostream>
//#include <vector>
//
//using namespace std;
//
//// Функция для создания и заполнения матрицы
//vector<vector<int>> createMatrix(int m, int n) {
//    vector<vector<int>> matrix(m, vector<int>(n));
//    cout << "Введите элементы матрицы:" << endl;
//    for (int i = 0; i < m; ++i) {
//        for (int j = 0; j < n; ++j) {
//            cin >> matrix[i][j];
//        }
//    }
//    return matrix;
//}
//
//// Функция для вывода матрицы
//void printMatrix(const vector<vector<int>>& matrix) {
//    for (const auto& row : matrix) {
//        for (int elem : row) {
//            cout << elem << " ";
//        }
//        cout << endl;
//    }
//}
//
//// Функция для перестановки строк в матрице
//void swapRows(vector<vector<int>>& matrix) {
//    int m = matrix.size();
//    int n = matrix[0].size();
//    for (int i = 0; i < m / 2; ++i) {
//        for (int j = 0; j < n; ++j) {
//            int temp = matrix[i][j];
//            matrix[i][j] = matrix[m - 1 - i][j];
//            matrix[m - 1 - i][j] = temp;
//        }
//    }
//}
//
//void main() {
//    // Ввод размера матрицы
//    int m, n;
//    cout << "Введите количество строк и столбцов матрицы:" << endl;
//    cin >> m >> n;
//
//    // Создание и заполнение матрицы
//    vector<vector<int>> matrix = createMatrix(m, n);
//
//    // Вывод изначальной матрицы
//    cout << "Введенная матрица:" << endl;
//    printMatrix(matrix);
//
//    // Перестановка строк в матрице
//    swapRows(matrix);
//
//    // Вывод новой матрицы
//    cout << "Матрица после перестановки строк:" << endl;
//    printMatrix(matrix);
//
//}