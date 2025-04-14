#include <iostream>
#include "CustomStack.h";


bool startsWithT(const std::string str) {
    if (str.empty()) return false;
    return str[0] == 't';
}

int main() {
    setlocale(LC_ALL, "Russian");
	Stack originalStack;
	Stack tStack;
	int k;

	std::cout << "Введите количество строк, которые хотите добавить в стек: ";
	std::cin >> k;

    std::cin.ignore();

	for (int i = 0; i < k; i++) {
		std::string input;
		std::cout << "Введите строку " << i + 1 << ": ";
		std::getline(std::cin, input);
		originalStack.push(input);
	}

	std::cout << "Удаление одного элемента из стека" << std::endl;
	originalStack.pop();

    Stack tempStack;  

    while (!originalStack.isEmpty()) {
        std::string currentTop = originalStack.topElement();
        if (startsWithT(currentTop)) {
            tStack.push(currentTop);
        }

        tempStack.push(currentTop);
        originalStack.pop();
    }

    while (!tempStack.isEmpty()) {
        originalStack.push(tempStack.topElement());
        tempStack.pop();
    }

    std::cout << "\nСтроки, начинающиеся с 't', в новом стеке:\n";
    while (!tStack.isEmpty()) {
        std::cout << tStack.topElement() << std::endl;
        tStack.pop();
    }

    return 0;
}
