#include <iostream>

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;

    TreeNode(int val) : data(val), left(nullptr), right(nullptr) {}
};

class BinaryTree {
private:
    TreeNode* root;

    TreeNode* insert(TreeNode* node, int value) {
        if (node == nullptr) {
            return new TreeNode(value);
        }
        if (value < node->data) {
            node->left = insert(node->left, value);
        }
        else if (value > node->data){
            node->right = insert(node->right, value);
        }
        return node;
    }

    void divideElementInto2Recursive(TreeNode* node) {
        if (node == nullptr) {
            return;
        }

        if (node->data % 2 == 0) {
            node->data /= 2;
        }

        divideElementInto2Recursive(node->left);
        divideElementInto2Recursive(node->right);
    }

    void printPostOrder(TreeNode* node) {
        if (node == nullptr) {
            return;
        }
        printPostOrder(node->left);
        printPostOrder(node->right);
        std::cout << node->data << " ";
    }
public:
    BinaryTree() : root(nullptr) {}

    void insert(int data) {
        root = insert(root, data);
    }

    void divideEvenElementsBy2() {
        divideElementInto2Recursive(root);
    }

    void printTree() {
        printPostOrder(root);
        std::cout << std::endl;
    }
};

int main() {
    setlocale(LC_ALL, "Russian");
    BinaryTree tree;
    tree.insert(5);
    tree.insert(3);
    tree.insert(7);
    tree.insert(2);
    tree.insert(4);
    tree.insert(6);
    tree.insert(8);
    tree.insert(1);

    std::cout << "Изначальное дерево(постфиксный обход):";
    tree.printTree();
    std::cout << std::endl;

    std::cout << "Изменённое дерево:";
    tree.divideEvenElementsBy2();
    tree.printTree();
    std::cout << std::endl;
}