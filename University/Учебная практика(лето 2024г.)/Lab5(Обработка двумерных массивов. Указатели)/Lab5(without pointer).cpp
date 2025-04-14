#include <iostream>
#include <vector>

using namespace std;

void main() {
    // ���� ࠧ��� ������
    int m, n;
    cout << "������ ������⢮ ��ப � �⮫�殢 ������:" << endl;
    cin >> m >> n;

    // �������� ������ � ������� vector
    vector<vector<int>> matrix(m, vector<int>(n));


    // ���������� ���ᨢ� ���祭�ﬨ
    cout << "������ ������ ������:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> matrix[i][j];
        }
    }

    // �뢮� ����砫쭮� ������
    cout << "��������� �����:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }

    // ����⠭���� ��ப � �����
    for (int i = 0; i < m / 2; ++i) {
        for (int j = 0; j < n; ++j) {
            int temp = matrix[i][j];
            matrix[i][j] = matrix[m - 1 - i][j];
            matrix[m - 1 - i][j] = temp;
        }
    }

    // �뢮� ����� ������
    cout << "����� ��᫥ ����⠭���� ��ப:" << endl;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}