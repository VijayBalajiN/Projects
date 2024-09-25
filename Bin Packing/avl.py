from node import Node

def comp_1(node_1, node_2):
    return node_1 < node_2

class AVLTree:
    def __init__(self, compare_function=comp_1):
        self.root = None
        self.size = 0
        self.comparator = compare_function

    def add_root(self, data, key):
        root = Node(data, key, 0)
        self.root = root
        self.size += 1

    def search(self, e):
        curr_node = self.root
        while curr_node is not None:
            if curr_node.key == e:
                return curr_node.data
            if curr_node.key < e:
                curr_node = curr_node.right
            else:
                curr_node = curr_node.left
        return -1

    def right_rotate(self, node):
        y = node.left
        node.left = y.right
        if y.right is not None:
            y.right.parent = node
        y.parent = node.parent
        if node.parent is None:
            self.root = y
        elif node == node.parent.left:
            node.parent.left = y
        else:
            node.parent.right = y
        y.right = node
        node.parent = y

        self.update_height(node)
        self.update_height(y)
        return y

    def left_rotate(self, node):
        y = node.right
        node.right = y.left
        if y.left is not None:
            y.left.parent = node
        y.parent = node.parent
        if node.parent is None:
            self.root = y
        elif node == node.parent.left:
            node.parent.left = y
        else:
            node.parent.right = y
        y.left = node
        node.parent = y

        self.update_height(node)
        self.update_height(y)
        return y

    def update_height(self, node):
        if node is None:
            return
        left_height = node.left.height if node.left else -1
        right_height = node.right.height if node.right else -1
        node.height = max(left_height, right_height) + 1

    def balance_factor(self, node):
        if not node:
            return 0
        left_height = node.left.height if node.left else -1
        right_height = node.right.height if node.right else -1
        return left_height - right_height

    def balance(self, node):
        bf = self.balance_factor(node)

        # Left heavy
        if bf > 1:
            if self.balance_factor(node.left) >= 0:
                node = self.right_rotate(node)  # Left-left case
            else:
                node.left = self.left_rotate(node.left)  # Left-right case
                node = self.right_rotate(node)
        # Right heavy
        elif bf < -1:
            if self.balance_factor(node.right) <= 0:
                node = self.left_rotate(node)  # Right-right case
            else:
                node.right = self.right_rotate(node.right)  # Right-left case
                node = self.left_rotate(node)

        return node

    def insert(self, data, key):
        if self.root is None:
            self.add_root(data, key)
        else:
            self.root = self._insert(self.root, data, key)

    def _insert(self, node, data, key):
        if node is None:
            self.size += 1
            return Node(data, key, 0)

        if key < node.key:
            node.left = self._insert(node.left, data, key)
            node.left.parent = node
        else:
            node.right = self._insert(node.right, data, key)
            node.right.parent = node

        self.update_height(node)
        return self.balance(node)

    def delete(self, data):
        self.root = self._delete(self.root, data)

    def _delete(self, node, data):
        if node is None:
            raise Exception("Data not found")

        if self.comparator(data, node.data):
            node.left = self._delete(node.left, data)
        elif self.comparator(node.data, data):
            node.right = self._delete(node.right, data)
        else:
            if node.left is None:
                return node.right
            elif node.right is None:
                return node.left

            temp = self.min_value_node(node.right)
            node.data, node.key = temp.data, temp.key
            node.right = self._delete(node.right, temp.data)

        self.update_height(node)
        return self.balance(node)

    def min_value_node(self, node):
        current = node
        while current.left is not None:
            current = current.left
        return current

    def bfs(self):
        q = []
        q.append(self.root)
        if self.root is None:
            return
        while q:
            node = q.pop(0)
            print(node.data, node.height)
            if node.left is not None:
                q.append(node.left)
            if node.right is not None:
                q.append(node.right)
    def greatest(self):
        return self._greatest(self.root)
    def _greatest(self,node):
        if node.right==None:
            return node.data
        return self._greatest(node.right)
    def inorder(self):
        l=[]
        self._inorder(self.root,l)
        return l
    def _inorder(self,node,l):
        if node!=None:
            self._inorder(node.left,l)
            try:l.append(node.data.object_id)
            except:
                try:l.append(node.data.bin_id)
                except:print(node.data)
            self._inorder(node.right,l)
    def search_lowest(self,size):
        return self._search_lowest(self.root,size)
    def _search_lowest(self,node,size):
        curr_ans=None
        while node!=None:
            if node.data.capacity>=size:
                curr_ans=node.data
                node=node.left
            else:
                node=node.right
        return  curr_ans
    def search_greatest(self,size):
        lowest=self.search_lowest(size)
        return self._search_greatest(self.root,lowest.capacity)
    def _search_greatest(self,node,size):
        curr_ans=None
        while node!=None:
            if node.data.capacity==size:
                curr_ans=node.data
                node=node.right
            else:
                if node.data.capacity>size:
                    node=node.left
                elif node.data.capacity<size:node=node.right
        return curr_ans
    def max_cap_lowest_id(self,size):
        max_cap=self.greatest().capacity
        return self.search_lowest(max_cap)
    def max_cap_greatest_id(self,size):
        return self.greatest()
        # return self.search_greatest(max_cap)


if __name__ == "__main__":
    a = AVLTree()
    l = [35, 24, 53, 41, 18, 57, 23, 63, 37, 24, 96, 48, 67, 35, 53, 64, 64, 33, 100, 83]
    for i in l:
        a.insert(i, i)
    a.bfs()
    for i in range(len(l)):
        a.delete(l[i])
    a.bfs()
