#include <iostream>

struct TreeNode {
    int value;
    TreeNode* left;
    TreeNode* right;

    TreeNode(int val) : value(val), left(nullptr), right(nullptr) {}
};

class BinaryTree {
private:
    TreeNode* root;

    TreeNode* insert(TreeNode* node, int value) {
        if (node == nullptr) {
            return new TreeNode(value);
        }
        if (value < node->value) {
            node->left = insert(node->left, value);
        }
        else {
            node->right = insert(node->right, value);
        }
        return node;
    }

    TreeNode* copyTree(TreeNode* original) {
        if (original == nullptr) {
            return nullptr;
        }
        TreeNode* copiedNode = new TreeNode(original->value);
        copiedNode->left = copyTree(original->left);
        copiedNode->right = copyTree(original->right);
        return copiedNode;
    }

public:
    BinaryTree() : root(nullptr) {}

    BinaryTree(const BinaryTree& other) {
        root = copyTree(other.root);
    }

    void insert(int value) {
        root = insert(root, value);
    }

    TreeNode* getRoot() {
        return root;
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

    std::cout << "Формирование дерева.\n";

    TreeNode* P1 = tree.getRoot();
    std::cout << "Указатель на корень непустого дерева (P1): " << P1 << std::endl << "\n";

    BinaryTree copiedTree = tree;
    TreeNode* P2 = copiedTree.getRoot();
    std::cout << "Указатель на корень созданной копии (P2): " << P2 << std::endl << "\n";

    return 0;
}
