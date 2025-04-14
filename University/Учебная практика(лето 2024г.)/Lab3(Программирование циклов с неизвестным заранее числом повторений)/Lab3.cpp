#include<iostream>
#include<cmath>

using namespace std;

int main() {
	//���樠������ ��६�����
	double a, b, M, fraction, term, sum, res1, res2;
	int count_terms;
	M = 0.4342944819032518;
	//���� ���祭��
	cout << "������ ���祭�� a(>0):";
	cin >> a;
	cout << "������ ���祭�� b(>0):";
	cin >> b;
	//�஢�ઠ ���祭��
	if (a <= 0 || b <= 0) {
		cout << "���祭�� a � b ������ ���� ����� 0!!!" << endl;
		return 1;
	}
	//���᫥��� �஡� b/(2a + b)
	fraction = b / (2 * a + b);
	sum = 0.0;
	//���� ��� �ਡ����⥫쭮�� ���᫥��� �㭪樨
	int n = 1;
	while (true) {
		int exp = 2 * n - 1;
		term = (1.0 / exp) * pow(fraction, exp);
		if (fabs(term) < 1e-10) {
			break;
		}
		sum += term;
		n++;
	}
	//���᫥��� �ਡ��������� ���祭�� 
	res1 = log10(a) + 2 * M * sum;
	res2 = log10(a + b);
	//�뢮� १���⮢
	cout << "�ਡ�������� ���祭�� lg(a+b):" << res1 << endl;
	cout << "��筮� ���祭�� lg(a+b):" << res2;

	return 0;
}