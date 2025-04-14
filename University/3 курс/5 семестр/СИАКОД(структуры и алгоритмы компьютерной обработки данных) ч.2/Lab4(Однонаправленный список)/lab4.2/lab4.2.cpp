#include <iostream>
#include <vector>
#include <limits>

struct Node {
    int data;
    Node* next;
};

class LinkedList {
private:
    Node* head;
    Node* tail;
    int length;

public:
    LinkedList() {
        head = new Node();
        head->data = 0;
        head->next = nullptr;
        tail = head;
        length = 0;
    }


    ~LinkedList() {
        Node* current = head;
        while (current != nullptr) {
            Node* temp = current;
            current = current->next;
            delete temp;
        }
        length = 0;
    }

    void appendAtEnd(int value) {
        Node* newNode = new Node();
        newNode->data = value;
        newNode->next = nullptr;

        tail->next = newNode;
        tail = newNode;
        ++length;
    }

    void printList() {
        Node* current = head->next;
        while (current != nullptr) {
            std::cout << current->data << " ";
            current = current->next;
        }
        std::cout << std::endl;
    }

    void splitList(LinkedList*& secondHalf) {
        if (length == 0) {
            std::cout << "Список пуст.\n";
            secondHalf = nullptr;
            return;
        }

        Node* slow = head;
        Node* fast = head;

        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
        }

        secondHalf = new LinkedList();
        secondHalf->head->next = slow->next;
        if (secondHalf->head->next != nullptr) {
            secondHalf->tail = tail;
            tail = slow;
            tail->next = nullptr;
            secondHalf->length = length - (length / 2);
            length = length / 2;
        }
    }

    void deletePrevious(int i) {
        if (i <= 1 || i > length) {
            std::cout << "Некорректный индекс. Попробуйте снова.\n";
            return;
        }

        Node* current = head;
        for (int index = 1; index < i - 1; ++index) {
            current = current->next;
        }

        Node* nodeToDelete = current->next;
        current->next = nodeToDelete->next;

        if (nodeToDelete == tail) {
            tail = current;
        }

        delete nodeToDelete;
        --length;
    }

    LinkedList* copyList() {
        LinkedList* newList = new LinkedList();
        Node* current = head->next;
        while (current != nullptr) {
            newList->appendAtEnd(current->data);
            current = current->next;
        }
        return newList;
    }

    bool isEqual(LinkedList* otherList) {
        if (length != otherList->length) {
            return false;
        }

        Node* current1 = head->next;
        Node* current2 = otherList->head->next;

        while (current1 != nullptr && current2 != nullptr) {
            if (current1->data != current2->data) {
                return false;
            }
            current1 = current1->next;
            current2 = current2->next;
        }

        return true;
    }

    int subOperation1() {
        if (length == 0) {
            std::cout << "Список пуст.\n";
            return std::numeric_limits<int>::min();
        }

        int maxValue = std::numeric_limits<int>::min();
        Node* current = head->next;
        while (current != nullptr) {
            if (current->data > maxValue) {
                maxValue = current->data;
            }
            current = current->next;
        }
        return maxValue;
    }

    void subOperation2() {
        Node* current = head->next;
        while (current != nullptr) {
            if (current->data < 0) {
                Node* newNode = new Node();
                newNode->data = 10;
                newNode->next = current->next;
                current->next = newNode;
                if (newNode->next == nullptr) {
                    tail = newNode;
                }
                ++length;
                return;
            }
            current = current->next;
        }
        std::cout << "В списке нет отрицательных элементов.\n";
    }

    void mergeLists(LinkedList* otherList) {
        if (otherList->length == 0) {
            std::cout << "Второй список пуст.\n";
            return;
        }

        tail->next = otherList->head->next;
        tail = otherList->tail;
        length += otherList->length;

        otherList->head->next = nullptr;
        otherList->tail = otherList->head;
        otherList->length = 0;
    }

    void deleteList() {
        delete this;
    }
};

int main() {
    setlocale(LC_ALL, "Russian");
    std::vector<LinkedList*> lists;
    int choice;
    bool isRunning = true;
    int currentListIndex = 0;


    std::cout << "Выбор операций:\n";
    std::cout << "1. Добавление элементов в конец списка.\n";
    std::cout << "2. Вывод элементов списка.\n";
    std::cout << "3. Разделение списка.\n";
    std::cout << "4. Удаление элемента, предшествующего i-ому.\n";
    std::cout << "5. Копирование списка.\n";
    std::cout << "6. Сравнение списков.\n";
    std::cout << "7. Удаление списка.\n";
    std::cout << "8. Поиск максимального элемента.\n";
    std::cout << "9. Вставка числа 10 после первого отрицательного элемента.\n";
    std::cout << "10. Соединение двух списков.\n";
    std::cout << "0. Выход из программы.\n";

    while (isRunning) {
        std::cout << "\nВыберите операцию: ";
        std::cin >> choice;

        if (lists.size() == 0 && choice != 0 && choice != 1) {
            std::cout << "Нет списков для данной операции.\n";
            continue;
        }

        if (lists.size() > 1 && choice != 6 && choice != 7 && choice != 10) {
            std::cout << "Выберите список для работы:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
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
            int n;
            std::cout << "Введите количество элементов, которые хотите добавить: ";
            std::cin >> n;

            if (lists.size() == 0) {
                lists.push_back(new LinkedList());
            }

            if (n < 0) {
                std::cout << "Вы выбрали отрицательное количество элементов. Оно может быть только положительным!";
                break;
            }

            for (int i = 0; i < n; ++i) {
                int value;
                std::cout << "Введите элемент (" << i + 1 << " из " << n << "): ";
                std::cin >> value;

                if (value < -250 || value > 250) {
                    std::cout << "Значение должно быть в диапазоне от -250 до 250. Попробуйте снова.\n";
                    --i;
                }
                else {
                    lists[currentListIndex]->appendAtEnd(value);
                }
            }

            std::cout << "Элементы добавлены в список.\n";
            break;
        }
        case 2: {
            if (lists.size() < 1) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            else {
                std::cout << "Элементы списка: ";
                lists[currentListIndex]->printList();
                break;
            }
        }
        case 3: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            LinkedList* secondHalf = nullptr;
            lists[currentListIndex]->splitList(secondHalf);
            if (secondHalf != nullptr) {
                lists.push_back(secondHalf);
                std::cout << "Список разделен.\n";
            }
            break;
        }
        case 4: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            int i;
            std::cout << "Введите номер элемента, чтобы удалить предшествующий: ";
            std::cin >> i;
            lists[currentListIndex]->deletePrevious(i);
            std::cout << "Вы успешно удалили элемент.\n";
            break;
        }
        case 5: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            LinkedList* newList = lists[currentListIndex]->copyList();
            lists.push_back(newList);
            std::cout << "Список скопирован.\n";
            break;
        }
        case 6: {
            if (lists.size() < 2) {
                std::cout << "Недостаточно списков для сравнения.\n";
                break;
            }

            std::cout << "Выберите первый список для сравнения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
            }
            int listChoice1;
            std::cin >> listChoice1;
            if (listChoice1 < 1 || listChoice1 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            std::cout << "Выберите второй список для сравнения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
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
        case 7: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            std::cout << "Выберите список для удаления:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
            }
            int listChoice;
            std::cin >> listChoice;
            if (listChoice < 1 || listChoice > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            lists[listChoice - 1]->deleteList();
            lists.erase(lists.begin() + listChoice - 1);
            if (lists.empty()) {
                lists.push_back(new LinkedList());
            }
            std::cout << "Список удален.\n";
            break;
        }
        case 8: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            int maxValue = lists[currentListIndex]->subOperation1();
            if (maxValue != std::numeric_limits<int>::min()) {
                std::cout << "Максимальный элемент: " << maxValue << std::endl;
            }
            break;
        }
        case 9: {
            if (lists.size() == 0) {
                std::cout << "Нет списков для данной операции.\n";
                break;
            }
            lists[currentListIndex]->subOperation2();
            std::cout << "Элемент успешно добавлен в список.\n";
            break;
        }
        case 10: {
            if (lists.size() < 2) {
                std::cout << "Недостаточно списков для соединения.\n";
                break;
            }

            std::cout << "Выберите первый список для соединения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
            }
            int listChoice1;
            std::cin >> listChoice1;
            if (listChoice1 < 1 || listChoice1 > lists.size()) {
                std::cout << "Некорректный выбор списка. Попробуйте снова.\n";
                continue;
            }

            std::cout << "Выберите второй список для соединения:\n";
            for (int i = 0; i < lists.size(); ++i) {
                std::cout << i + 1 << ". Список " << i + 1 << std::endl;
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
            std::cout << "Списки соединены.\n";
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

    for (LinkedList* list : lists) {
        delete list;
    }

    return 0;
}