//#include <iostream>
//#include <vector>
//
//using namespace std;
//
//// �㭪�� ��� ᮧ����� � ���������� ������
//vector<vector<int>> createMatrix(int m, int n) {
//    vector<vector<int>> matrix(m, vector<int>(n));
//    cout << "������ ������ ������:" << endl;
//    for (int i = 0; i < m; ++i) {
//        for (int j = 0; j < n; ++j) {
//            cin >> matrix[i][j];
//        }
//    }
//    return matrix;
//}
//
//// �㭪�� ��� �뢮�� ������
//void printMatrix(const vector<vector<int>>& matrix) {
//    for (const auto& row : matrix) {
//        for (int elem : row) {
//            cout << elem << " ";
//        }
//        cout << endl;
//    }
//}
//
//// �㭪�� ��� ����⠭���� ��ப � �����
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
//    // ���� ࠧ��� ������
//    int m, n;
//    cout << "������ ������⢮ ��ப � �⮫�殢 ������:" << endl;
//    cin >> m >> n;
//
//    // �������� � ���������� ������
//    vector<vector<int>> matrix = createMatrix(m, n);
//
//    // �뢮� ����砫쭮� ������
//    cout << "��������� �����:" << endl;
//    printMatrix(matrix);
//
//    // ����⠭���� ��ப � �����
//    swapRows(matrix);
//
//    // �뢮� ����� ������
//    cout << "����� ��᫥ ����⠭���� ��ப:" << endl;
//    printMatrix(matrix);
//
//}