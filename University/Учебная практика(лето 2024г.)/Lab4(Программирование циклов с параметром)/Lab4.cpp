#include<iostream>

using namespace std;

void main() {
	//���樠������ ��६�����
	int arr1[10], count = 0, i;
	//���樠������ ���ᨢ�
	cout << "������ 10 �ᥫ ��� ���ᨢ�:";
	for (i = 0; i < 10; ++i) {
		cin >> arr1[i];
	}
	cout << "����砫�� ���ᨢ: ";
	for (i = 0; i < 10; ++i) {
		cout << arr1[i] << " ";
	}
	cout << endl;
	//����� � ���ᨢ��
	for (i = 0; i < 10; ++i) {
		if (arr1[i] < 0) {
			count += 1;
		}
		if ((arr1[i] >= 0) && (arr1[i] <= 10)) {
			arr1[i] = arr1[i] * 3;
		}
	}
	//�뢮�
	cout << "������⢮ ����⥫��� ����⮢: " << count << endl;
	cout << "��������� ���ᨢ: ";
	for (i = 0; i < 10; ++i) {
		cout << arr1[i] << " ";
	}
}