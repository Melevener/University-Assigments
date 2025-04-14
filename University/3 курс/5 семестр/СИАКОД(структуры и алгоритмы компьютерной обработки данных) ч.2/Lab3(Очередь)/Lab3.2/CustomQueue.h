#pragma once
#include<iostream>

struct Node {
    double value;  
    Node* next;

    Node(double val) : value(val), next(nullptr) {}
};

class Queue {
private:
    Node* head;  // Указатель на передний элемент (голову)
    Node* tail;  // Указатель на задний элемент (хвост)

public:
    Queue() : head(nullptr), tail(nullptr) {}

    ~Queue() {
        while (!isEmpty()) {
            dequeue();
        }
    }

    bool isEmpty() const {
        return head == nullptr;
    }

    // Удаление элемента из очереди с начала
    void dequeue() {
        if (isEmpty()) {
            std::cout << "Очередь пуста, нечего удалять!" << std::endl;
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
    void enqueue(double value) {
        Node* newNode = new Node(value);

        if (isEmpty()) {
            head = tail = newNode;
        }
        else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    // Получение переднего элемента
    double getHead() {
        if (!isEmpty()) {
            return head->value;
        }
        else {
            std::cout << "Очередь пуста!" << std::endl;
            return -1;
        }
    }
};