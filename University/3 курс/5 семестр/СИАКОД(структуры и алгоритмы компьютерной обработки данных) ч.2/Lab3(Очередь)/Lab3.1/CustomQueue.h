#pragma once
#include<iostream>
#include<string>

struct Node {
    double cathet1;
    double cathet2;
    Node* next;

    Node(double c1, double c2) : cathet1(c1), cathet2(c2), next(nullptr) {}
};

class Queue {
private:
    // Указатель на передний элемент (голову)
    Node* head;
    // Указатель на задний элемент (хвост)
    Node* tail;

public:
    Queue() : head(nullptr), tail(nullptr) {}
    ~Queue() {
        while (!isEmpty()) {
            dequeue();
        }
    }

    bool isEmpty() {
        return head == nullptr;
    }

    // Удаление элемента из очереди с начала
    void dequeue() {
        if (isEmpty()) {
            std::cout << "Очередь пуста, нечего удалять!!!\n";
            return;
        }

        Node* temp = head;
        head = head->next;

        if (head == nullptr) {
            tail = nullptr;
        }

        delete temp;
    }

    // Добавление элемента в очередь в конец
    void enqueue(double c1, double c2) {
        Node* newNode = new Node(c1, c2);

        if (isEmpty()) {
            head = tail = newNode;
        }
        else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    // Получение переднего элемента
    void getHead(double& c1, double& c2) {
        if (!isEmpty()) {
            c1 = head->cathet1;
            c2 = head->cathet2;
        }
        else {
            std::cout << "Очередь пуста!!!\n";
        }
    }
};