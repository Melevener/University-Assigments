#include <iostream>

using namespace std;

// �㭪�� ��� ᮧ����� � ���������� ������
int** createMatrix(int m, int n) {
    int** matrix = new int* [m];
    for (int i = 0; i < m; ++i) {
        matrix[i] = new int[n];
    }

    cout << "������ ������ ������:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> matrix[i][j];
        }
    }

    return matrix;
}

// �㭪�� ��� �뢮�� ������
void printMatrix(int** matrix, int m, int n) {
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

// �㭪�� ��� ����⠭���� ��ப � �����
void swapRows(int** matrix, int m, int n) {
    for (int i = 0; i < m / 2; ++i) {
        for (int j = 0; j < n; ++j) {
            int temp = matrix[i][j];
            matrix[i][j] = matrix[m - 1 - i][j];
            matrix[m - 1 - i][j] = temp;
        }
    }
}

// �㭪�� ��� �᢮�������� �����
void deleteMatrix(int** matrix, int m) {
    for (int i = 0; i < m; ++i) {
        delete[] matrix[i];
    }
    delete[] matrix;
}

int main() {
    // ���� ࠧ��� ������
    int m, n;
    cout << "������ ������⢮ ��ப � �⮫�殢 ������:" << endl;
    cin >> m >> n;

    // �������� � ���������� ������
    int** matrix = createMatrix(m, n);

    // �뢮� ����砫쭮� ������
    cout << "��������� �����:" << endl;
    printMatrix(matrix, m, n);

    // ����⠭���� ��ப � �����
    swapRows(matrix, m, n);

    // �뢮� ����� ������
    cout << "����� ��᫥ ����⠭���� ��ப:" << endl;
    printMatrix(matrix, m, n);

    // �᢮�������� �����
    deleteMatrix(matrix, m);

    return 0;
}