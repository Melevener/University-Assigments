#include<iostream>
#include<string>
#include<algorithm>

using namespace std;

void main() {
	//���樠������ ��᫥����⥫쭮�� ��ப
	string words[10];
	//���� ᫮�
	cout << "������ 10 ��⨡㪢����� ᫮�:" << endl;
	for (int i = 0; i < 10; ++i) {
		cin >> words[i];
		if (words[i].length() != 5) {
			cout << "�� ����� �� ��⨡㪢����� ᫮��!!!" << endl;
		}
	}
	//����஢�� � ������� ������⥪� �����⬮�
	sort(words, words + 10);
	//�뢮� �����஢����� ��᫥����⥫쭮��
	for (int i = 0; i < 10; ++i) {
		cout << words[i] << " ";
	}
}