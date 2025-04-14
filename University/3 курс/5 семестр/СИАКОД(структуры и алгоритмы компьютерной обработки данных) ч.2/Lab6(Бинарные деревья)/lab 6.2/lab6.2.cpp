#include <iostream>
#include <vector>

struct TreeNode {
    int Value;
    TreeNode* Left;
    TreeNode* Right;

    TreeNode(int val) : Value(val), Left(nullptr), Right(nullptr) {}
};

class BinaryTree {
public:
    BinaryTree(int arr[], int n) {
        Root = nullptr;
        for (int i = 0; i < n; ++i) {
            InsertNode(arr[i]);
        }
    }

    void PostOrder(std::vector<int>& result) {
        PostOrderRecursive(Root, result);
    }

    TreeNode* GetRoot() {
        return Root;
    }

private:
    TreeNode* Root;

    void InsertNode(int value) {
        Root = InsertNodeRecursive(Root, value);
    }

    TreeNode* InsertNodeRecursive(TreeNode* root, int value) {
        if (root == nullptr) {
            return new TreeNode(value);
        }

        if (value % 2 != 0) {
            root->Left = InsertNodeRecursive(root->Left, value);
        }
        else {
            root->Right = InsertNodeRecursive(root->Right, value);
        }

        return root;
    }

    void PostOrderRecursive(TreeNode* root, std::vector<int>& result) {
        if (root == nullptr) {
            return;
        }

        PostOrderRecursive(root->Left, result);
        PostOrderRecursive(root->Right, result);
        result.push_back(root->Value);
    }
};

int main() {
    setlocale(LC_ALL, "Russian");
    int arr[] = { 10, 3, 5, 7, 2, 8 };
    int n = sizeof(arr) / sizeof(arr[0]);

    BinaryTree tree(arr, n);

    std::vector<int> result;
    tree.PostOrder(result);

    std::cout << "Постфиксный обход дерева: ";
    for (int value : result) {
        std::cout << value << " ";
    }
    std::cout << std::endl;

    TreeNode* root = tree.GetRoot();
    std::cout << "Указатель на корень дерева: " << root << std::endl;

    return 0;
}
