#include <iostream>
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

    TreeNode* insert(TreeNode* node, int value) {
        if (node == nullptr) {
            return new TreeNode(value);
        }
        if (value < node->data) {
            node->left = insert(node->left, value);
        }
        else {
            node->right = insert(node->right, value);
        }
        return node;
    }

    int SumLeavesRecursive(TreeNode* node) {
        if (node == nullptr) {
            return 0;
        }
        if (node->left == nullptr && node->right == nullptr) {
            return node->data;
        }
        return SumLeavesRecursive(node->left) + SumLeavesRecursive(node->right);
    }

    void PostOrderRecursive(TreeNode* node) {
        if (node == nullptr) {
            return;
        }
        PostOrderRecursive(node->left);
        PostOrderRecursive(node->right);
        std::cout << node->data << " ";
    }

    int MaxInternaldataRecursive(TreeNode* node, int& maxdata) {
        if (node == nullptr) {
            return INT_MIN;
        }
        if (node->left != nullptr || node->right != nullptr) {
            maxdata = std::max(maxdata, node->data);
        }
        MaxInternaldataRecursive(node->left, maxdata);
        MaxInternaldataRecursive(node->right, maxdata);
        return maxdata;
    }

public:
    BinaryTree() : root(nullptr) {}

    void insert(int data) {
        root = insert(root, data);
    }

    int SumLeaves() {
        return SumLeavesRecursive(root);
    }

    void PostOrder() {
        PostOrderRecursive(root);
        std::cout << std::endl;
    }

    int MaxInternaldata() {
        int maxdata = INT_MIN;
        MaxInternaldataRecursive(root, maxdata);
        return maxdata;
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

    std::cout << "Анализ дерева.\n";
    std::cout << "Задача 7. Сумма всех листьев: " << tree.SumLeaves() << std::endl << "\n";

    std::cout << "Задача 14. Постфиксный обход: ";
    tree.PostOrder();
    std::cout << std::endl;

    std::cout << "Задача 22. Максимальное значение внутренних вершин: " << tree.MaxInternaldata() << std::endl << "\n";

    return 0;
}
