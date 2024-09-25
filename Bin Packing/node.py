class Node:
        __slots__="data","key","left","right","parent","height"
        def __init__(self,data,key,height,parent=None,left=None,right=None):
            self.data=data
            self.key=key
            self.left=left
            self.right=right
            self.parent=parent
            self.height=height