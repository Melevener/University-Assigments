#include"CustomQueue.h"
#include<iostream>

double getPerimetr(double a, double b) {
    double c = sqrt(a * a + b * b);
    double perimetr = a + b + c;

    return perimetr;
}

int main() {
    setlocale(LC_ALL, "Russian");
    Queue que;
    double cat1, cat2, perimetr;

    // Добавление в очередь треугольников с катетами
    que.enqueue(3.0, 4.0);
    que.enqueue(5.0, 12.0);

    // Получение передних катетов
    que.getHead(cat1, cat2);

    std::cout << "Извлечён треугольник с катетами: " << cat1 << " и " << cat2 << "\n";

    // Вычисляем периметр
    perimetr = getPerimetr(cat1, cat2);
    std::cout << "Периметр треугольника: " << perimetr << std::endl;

    return 0;
}