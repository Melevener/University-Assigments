#include "CustomList.h"
#include <iostream>

int main() {
    setlocale(LC_ALL, "Russian");
    LinkedList myList;
    int choice;
    bool isRunning = true;

    std::cout << "Выбор операций:\n";
    std::cout << "1. Создать пустой список\n";
    std::cout << "2. Проверить, пуст ли список\n";
    std::cout << "3. Заполнить список случайными числами\n";
    std::cout << "4. Вывести список\n";
    std::cout << "5. Получить длину списка\n";
    std::cout << "6. Вставить новый элемент\n";
    std::cout << "7. Выход\n";

    while (isRunning) {
        std::cout << "\nВыберите операцию: ";
        std::cin >> choice;

        switch (choice) {
        case 1: {
            myList.~LinkedList();
            new (&myList) LinkedList();
            std::cout << "Пустой список создан.\n";
            break;
        }
        case 2: {
            if (myList.getLength() == 0) {
                std::cout << "Список пуст.\n";
            }
            else {
                std::cout << "Список не пуст.\n";
            }
            break;
        }
        case 3: {
            int count;
            std::cout << "Введите количество элементов для заполнения списка: ";
            std::cin >> count;
            myList.fillListRandom(count);
            std::cout << "Список заполнен случайными числами.\n";
            break;
        }
        case 4: {
            std::cout << "Список: \n";
            myList.printList();
            break;
        }
        case 5: {
            std::cout << "Длина списка: " << myList.getLength() << std::endl;
            break;
        }
        case 6: {
            int index, newValue;

            if (myList.getLength() == 0) {
                std::cout << "Список не создан. Невозможно добавить элемент" << std::endl;
                break;
            }

            std::cout << "Введите индекс, за которым хотите добавить элемент: ";
            std::cin >> index;

            if (index >= myList.getLength() || index < 0) {
                std::cout << "Ошибка: индекс выходит за границы списка!\n";
            }
            else {
                std::cout << "Введите значение элемента (в диапазоне [-250, 250]): ";
                std::cin >> newValue;
                if (newValue >= -250 && newValue <= 250) {
                    myList.insertElementAfter(index, newValue);
                    std::cout << "Элемент добавлен.\n";
                }
                else {
                    std::cout << "Элемент должен быть в диапазоне [-250, 250]!\n";
                }
            }
            break;
        }
        case 7: {
            isRunning = false;
            std::cout << "Выход из программы.\n";
            break;
        }
        default: {
            std::cout << "Неверный выбор. Пожалуйста, выберите снова.\n";
            break;
        }
        }
    }

    return 0;
}