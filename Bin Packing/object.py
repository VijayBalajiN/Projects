from enum import Enum

class Color(Enum):
    BLUE = 1
    YELLOW = 2
    RED = 3
    GREEN = 4
    

class Object:
    def __init__(self, object_id, size, color):
        self.object_id=object_id
        self.size=size
        self.color=color
        self.bin=None
        pass
if __name__=="__main__":
    asdf=Object(1,2,Color.BLUE)
    # print(enumerate.asdf.color)
    print(Color.BLUE)
    if asdf.color==1:
        print("YES")
    if asdf.color==Color.BLUE:
        print("NO")
