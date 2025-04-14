#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;

    TreeNode(int val) : data(val), left(nullptr), right(nullptr) {}
};

class BinaryTree {
private:
    TreeNode* root;

    TreeNode* insertRecursive(TreeNode* node, int value) {
        if (node == nullptr) {
            return new TreeNode(value);
        }
        if (value < node->data) {
            node->left = insertRecursive(node->left, value);
        }
        else {
            node->right = insertRecursive(node->right, value);
        }
        return node;
    }

    TreeNode* insertWrongRecursive(TreeNode* node, int value) {
        if (node == nullptr) {
            return new TreeNode(value);
        }
        node->left = insertWrongRecursive(node->left, value);
        return node;
    }

    void treeInOrderRecursive(TreeNode* node, std::vector<TreeNode*>& result) {
        if (node == nullptr) return;
        treeInOrderRecursive(node->left, result);
        result.push_back(node);
        treeInOrderRecursive(node->right, result);
    }

public:
    BinaryTree() : root(nullptr) {}

    void insert(int data) {
        root = insertRecursive(root, data);
    }

    void insertWrong(int data) {
        root = insertWrongRecursive(root, data);
    }

    std::vector<TreeNode*> getInOrder() {
        std::vector<TreeNode*> result;
        treeInOrderRecursive(root, result);
        return result;
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

    tree.insertWrong(10);

    std::vector<TreeNode*> inOrderNodes = tree.getInOrder();

    std::vector<int> inOrderValues;
    for (TreeNode* node : inOrderNodes) {
        inOrderValues.push_back(node->data);
        std::cout << node->data << " ";
    }
    std::cout << std::endl;

    std::vector<int> sortedValues = inOrderValues;
    std::sort(sortedValues.begin(), sortedValues.end());

    if (inOrderValues == sortedValues) {
        std::cout << "nullptr" << std::endl;
    }
    else {
        for (size_t i = 1; i < inOrderValues.size(); ++i) {
            if (inOrderValues[i] < inOrderValues[i - 1]) {
                std::cout << "Нарушение закономерности в вершине с адресом: " << inOrderNodes[i] << " и значением: " << inOrderValues[i] << std::endl;
                break;
            }
        }
    }

    return 0;
}
