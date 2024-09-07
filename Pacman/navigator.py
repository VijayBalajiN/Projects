from maze import *
from exception import *
from stack import *
class PacMan:
    def __init__(self, grid : Maze) -> None:
        ## DO NOT MODIFY THIS FUNCTION
        self.navigator_maze = grid.grid_representation
        
    def can_visit(self,x,y,visited):
        if 0<=x<=len(visited)-1 and 0<=y<=len(visited[0])-1: #changed
            pass #changed
        else:
            return False
        if visited[x][y]:
            return False
        if self.navigator_maze[x][y]:
            return False
        return True
    def return_path(self,path): #changed
        l=[]
        l.append(path.pop())
        for i in range(path.length()): #changed
            xi,yi=path.pop()
            if self.chk(l[-1][0],l[-1][1],xi,yi):l.append((xi,yi)) #changed
        # print(l[::-1])
        return l[::-1]#changed
    def chk(self,xi,yi,x,y):  #changed
        if abs(xi-x)+abs(yi-y)==1:
            return True
            
        return False
        
    def find_path(self, start , end ) :
        # IMPLEMENT FUNCTION HERE
        path=Stack() #changed
        visited=[]
        m=len(self.navigator_maze)
        n=len(self.navigator_maze[0])
        for row in range(m):
            grid_row = []
            for column in range(n):
                grid_row.append(0)
            visited.append(grid_row) #changed
        if self.can_visit(start[0],start[1],visited):path.push(start)
        visited[start[0]][start[1]]=1
        while path.length():
            #path.print()
            x,y=path.top()
            if (x,y)==end:        #changed
                return self.return_path(path) #changed
                break
            cnt=0
            li=[[x+1,y],[x,y+1],[x-1,y],[x,y-1]]
            for i in range(4):
                xi,yi=li[i]
                if self.can_visit(xi,yi,visited): #changed
                    visited[xi][yi]=1
                    path.push((xi,yi)) #changed
                    cnt+=1
            if cnt==0:
                path.pop()
        else:
            raise PathNotFoundException