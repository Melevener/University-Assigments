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
//	//���� ࠧ��� ������
//	int m, n;
//	cout << "������ ������⢮ ��ப � �⮫�殢 ������:" << endl;
//	cin >> m >> n;
//	//�������᪮� �뤥����� ����� ��� ������
//	int** matrix = new int* [m];
//	for (int i = 0; i < m; ++i) {
//		matrix[i] = new int[n];
//	}
//	//���������� ���ᨢ� ���祭�ﬨ
//	cout << "������ ������ ������:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cin >> matrix[i][j];
//		}
//	}
//	//�뢮� ����砫쭮� ������
//	cout << "��������� �����:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cout << matrix[i][j] << " ";
//		}
//		cout << endl;
//	}
//	//����⠭���� ��ப � �����
//	for (int i = 0; i < m / 2; ++i) {
//		for (int j = 0; j < n; ++j) {
//			swapElements(matrix[i][j], matrix[m - 1 - i][j]);
//		}
//	}
//	//�뢮� ����� ������
//	cout << "����� ��᫥ ����⠭���� ��ப:" << endl;
//	for (int i = 0; i < m; ++i) {
//		for (int j = 0; j < n; ++j) {
//			cout << matrix[i][j] << " ";
//		}
//		cout << endl;
//	}
//	//�᢮�������� �����
//	for (int i = 0; i < m; ++i) {
//		delete[] matrix[i];
//	}
//	delete[] matrix;
//}
//
//
