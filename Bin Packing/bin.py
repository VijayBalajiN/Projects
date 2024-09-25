from avl import AVLTree
class Bin:
    def __init__(self, bin_id, capacity):
        self.bin_id=bin_id
        self.capacity=capacity
        self.avl_object=AVLTree(lambda x,y: (x.object_id<y.object_id))
        
    def add_object(self, object):
        # Implement logic to add an object to this bin
        self.capacity-=object.size
        self.avl_object.insert(object,object.object_id)
        pass

    def remove_object(self, object_id):
        # Implement logic to remove an object by ID
        object=self.avl_object.search(object_id)   #search using the keys
        self.avl_object.delete(object)
        self.capacity+=object.size
        pass
    
    def all_objects(self):
        l=self.avl_object.inorder()  #implement inorder for the avl tree
        return l