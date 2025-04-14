#include <iostream>
#include <vector>
#include <limits>
#include <cstdlib>
#include <ctime>

struct Node {
    int data;
    Node* next;
    Node* prev;
};

class doubleLinkedList {
private:
    Node* head;
    Node* tail;
    int length;
public:
    doubleLinkedList() {
        head = nullptr;
        tail = nullptr;
        length = 0;
    }

    ~doubleLinkedList() {
        Node* current = head;
        while (current != nullptr) {
            Node* temp = current;
            current = current->next;
            delete temp;
        }
        length = 0;
    }

    bool isEmpty() {
        return length == 0;
    }

    void appendAtEnd(int value) {
        Node* newNode = new Node();
        newNode->data = value;
        newNode->next = nullptr;
        newNode->prev = tail;

        if (tail != nullptr) {
            tail->next = newNode;
        }
        tail = newNode;

        if (head == nullptr) {
            head = newNode;
        }
        ++length;
    }

    void printList() {
        Node* current = head;
        while (current != nullptr) {
            std::cout << current->data << " ";
            current = current->next;
        }
        std::cout << std::endl;
    }

    int getLength() {
        return length;
    }

    void insertAtPosition(int value, int position) {
        if (position < 1 || position > length + 1) {
            std::cout << "Некорректная позиция.\n";
            return;
        }

        Node* newNode = new Node();
        newNode->data = value;

        if (position == 1) {
            newNode->next = head;
            newNode->prev = nullptr;
            if (head != nullptr) {
                head->prev = newNode;
            }
            head = newNode;
        }
        else {
            Node* current = head;
            for (int i = 1; i < position - 1 && current != nullptr; ++i) {
                current = current->next;
            }
            if (current == nullptr) {
                std::cout << "Некорректная позиция.\n";
                delete newNode;
                return;
            }
            newNode->next = current->next;
            newNode->prev = current;
            if (current->next != nullptr) {
                current->next->prev = newNode;
            }
            else {
                tail = newNode;
            }
            current->next = newNode;
        }
        ++length;
        std::cout << "Элемент вставлен.\n";
    }

    void deletePrevious(int position) {
        if (position <= 1 || position > length) {
            std::cout << "Некорректная позиция.\n";
            return;
        }

        Node* current = head;
        for (int i = 1; i < position; ++i) {
            current = current->next;
        }

        if (current == nullptr || current->prev == nullptr) {
            std::cout << "Некорректная позиция.\n";
            return;
        }

        Node* nodeToDelete = current->prev;
        if (nodeToDelete->prev != nullptr) {
            nodeToDelete->prev->next = current;
        }
        else {
            head = current;
        }
        current->prev = nodeToDelete->prev;

        delete nodeToDelete;
        --length;
        std::cout << "Элемент удален.\n";
    }

    void splitList(doubleLinkedList& secondHalf) {
        if (length == 0) {
            std::cout << "Список пуст. Разбиение невозможно.\n";
            return;
        }

        Node* slow = head;
        Node* fast = head;
        int mid = length / 2;

        if (length % 2 == 0) {
            fast = fast->next;
        }

        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
        }

        if (slow == nullptr) {
            return;
        }

        secondHalf.head = slow->next;
        if (secondHalf.head != nullptr) {
            secondHalf.head->prev = nullptr;
            secondHalf.tail = tail;
            tail = slow;
            slow->next = nullptr;
            secondHalf.length = length - mid;
            length = mid;
        }
        std::cout << "Список разделен.\n";
    }

    doubleLinkedList* copyList() {
        doubleLinkedList* newList = new doubleLinkedList();
        Node* current = head;
        while (current != nullptr) {
            newList->appendAtEnd(current->data);
            current = current->next;
        }
        std::cout << "Список скопирован.\n";
        return newList;
    }

    bool isEqual(doubleLinkedList* otherList) {
        if (length != otherList->length) {
            return false;
        }

        Node* current1 = head;
        Node* current2 = otherList->head;

        while (current1 != nullptr && current2 != nullptr) {
            if (current1->data != current2->data) {
                return false;
            }
            current1 = current1->next;
            current2 = current2->next;
        }

        return true;
    }

    void mergeLists(doubleLinkedList* otherList) {
        if (otherList->length == 0) {
            std::cout << "Второй список пуст.\n";
            return;
        }

        tail->next = otherList->head;
        otherList->head->prev = tail;
        tail = otherList->tail;
        length += otherList->length;

        otherList->head = nullptr;
        otherList->tail = nullptr;
        otherList->length = 0;
        std::cout << "Списки соединены.\n";
    }

    void deleteList() {
        delete this;
    }

    void fillList(int count) {
        for (int i = 0; i < count; ++i) {
            int value = rand() % 501 - 250;
            appendAtEnd(value);
        }
        std::cout << "Список заполнен.\n";
    }

    void findPositiveDifference() {
        Node* current = head;
        int result = 0;
        bool firstPositiveFound = false;

        while (current != nullptr) {
            if (current->data > 0) {
                if (!firstPositiveFound) {
                    result = current->data;
                    firstPositiveFound = true;
                }
                else {
                    result -= current->data;
                }
            }
            current = current->next;
        }

        if (firstPositiveFound) {
            std::cout << "Разность положительных элементов: " << result << std::endl;
        }
        else {
            std::cout << "В списке нет положительных элементов.\n";
        }
    }
};

int main() {
    setlocale(LC_ALL, "Russian");
    std::vector<doubleLinkedList*> lists;
    int choice;
    bool isRunning = true;
    int currentListIndex = 0;

    std::cout << "Выбор операций:\n";
    std::cout << "1. Создание пустого списка.\n";
    std::cout << "2. Проверка списка на пустоту.\n";
    std::cout << "3. Заполнение списка случайными числами.\n";
    std::cout << "4. Вывод списка.\n";
    std::cout << "5. Определение длины списка.\n";
    std::cout << "6. Вставка нового элемента в i-ую позицию.\n";
    std::cout << "7. Удаление элемента, предшествующего i-ому.\n";
    std::cout << "8. Разбиение списка на 2 списка.\n";
    std::cout << "9. Соединение двух списков в один.\n";
    std::cout << "10. Создание копии списка.\n";
    std::cout << "11. Проверка двух списков на равенство.\n";
    std::cout << "12. Удаление всех элементов списка.\n";
    std::cout << "13. Нахождение разности положительных элементов.\n";
    std::cout << "0. Выход из программы.\n";

    srand(static_cast<unsigned int>(time(0)));

    while (isRunning) {
        std::cout << "\nВыберите операцию: ";
        std::cin >> choice;

        if (lists.size() == 0 && choice != 0 && choice != 1) {
            std::cout << "Нет списков для данной операции.\n";
            continue;
        }

        if (lists.size() > 1 && choice != 9 && choice != 11 && choice != 12) {
            std::cout << "Выберите список для работы:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice;
            std::cin >> listChoice;
            if (listChoice > 0 && listChoice <= lists.size()) {
                currentListIndex = listChoice - 1;
            }
            else {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }
        }
        else {
            currentListIndex = 0;
        }

        switch (choice) {
        case 1: {
            lists.push_back(new doubleLinkedList());
            std::cout << "Пустой список создан.\n";
            break;
        }
        case 2: {
            if (lists[currentListIndex]->isEmpty()) {
                std::cout << "Список пуст.\n";
            }
            else {
                std::cout << "Список не пуст.\n";
            }
            break;
        }
        case 3: {
            int count;
            std::cout << "Введите количество элементов для заполнения: ";
            std::cin >> count;
            if (count <= 0) {
                std::cout << "Невозможно добавить нулевое или отрицательное количество элементов.\n";
                break;
            }
            if (lists.size() == 0) {
                lists.push_back(new doubleLinkedList());
                currentListIndex = 0;
            }
            lists[currentListIndex]->fillList(count);
            break;
        }
        case 4: {
            std::cout << "Элементы списка: ";
            lists[currentListIndex]->printList();
            break;
        }
        case 5: {
            std::cout << "Длина списка: " << lists[currentListIndex]->getLength() << std::endl;
            break;
        }
        case 6: {
            int value, position;
            std::cout << "Введите значение для вставки: ";
            std::cin >> value;
            std::cout << "Введите позицию для вставки: ";
            std::cin >> position;
            lists[currentListIndex]->insertAtPosition(value, position);
            break;
        }
        case 7: {
            int position;
            if (lists[currentListIndex]->isEmpty()) {
                std::cout << "Невозможно удалить элементы из пустого списка.\n";
                break;
            }
            std::cout << "Введите позицию для удаления предшествующего элемента: ";
            std::cin >> position;
            lists[currentListIndex]->deletePrevious(position);
            break;
        }
        case 8: {
            if (lists[currentListIndex]->isEmpty()) {
                std::cout << "Список пуст. Разбиение невозможно.\n";
                break;
            }

            doubleLinkedList* secondHalf = new doubleLinkedList();
            lists[currentListIndex]->splitList(*secondHalf);
            lists.push_back(secondHalf);
            break;
        }
        case 9: {
            if (lists.size() < 2) {
                std::cout << "Недостаточно списков для соединения.\n";
                break;
            }

            std::cout << "Выберите первый список для соединения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice1;
            std::cin >> listChoice1;
            if (listChoice1 < 1 || listChoice1 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            std::cout << "Выберите второй список для соединения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice2;
            std::cin >> listChoice2;
            if (listChoice2 < 1 || listChoice2 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            lists[listChoice1 - 1]->mergeLists(lists[listChoice2 - 1]);
            lists[listChoice2 - 1]->deleteList();
            lists.erase(lists.begin() + listChoice2 - 1);
            break;
        }
        case 10: {
            doubleLinkedList* newList = lists[currentListIndex]->copyList();
            lists.push_back(newList);
            break;
        }
        case 11: {
            if (lists.size() < 2) {
                std::cout << "Недостаточно списков для сравнения.\n";
                break;
            }

            std::cout << "Выберите первый список для сравнения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice1;
            std::cin >> listChoice1;
            if (listChoice1 < 1 || listChoice1 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            std::cout << "Выберите второй список для сравнения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice2;
            std::cin >> listChoice2;
            if (listChoice2 < 1 || listChoice2 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            if (lists[listChoice1 - 1]->isEqual(lists[listChoice2 - 1])) {
                std::cout << "Списки равны.\n";
            }
            else {
                std::cout << "Списки не равны.\n";
            }
            break;
        }
        case 12: {
            std::cout << "Выберите список для удаления:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << " \n";
            }
            int listChoice;
            std::cin >> listChoice;
            if (listChoice > 0 && listChoice <= lists.size()) {
                lists[listChoice - 1]->deleteList();
                lists.erase(lists.begin() + listChoice - 1);
                std::cout << "Список удален.\n";
            }
            else {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
            }
            break;
        }
        case 13: {
            if (lists.size() == 0) {
                std::cout << "Нету списков для выполнения операции.\n";
                break;
            }
            lists[currentListIndex]->findPositiveDifference();
            break;
        }
        case 0: {
            isRunning = false;
            std::cout << "Выход из программы.\n";
            break;
        }
        default: {
            std::cout << "Некорректный выбор. Попробуйте снова.\n";
            break;
        }
        }
    }

    for (doubleLinkedList* list : lists) {
        delete list;
    }

    return 0;
}
