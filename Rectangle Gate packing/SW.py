import queue
import time
class place:
    __slots__ = ['grid','l','h','w','slots']
    def __init__(self,h,w,l):  
        self.grid = [[0 for i in range(h)] for j in range(w)]
        self.l=l
        self.h=h
        self.w=w
        self.slots=queue.PriorityQueue()
        self.slots.put((0,0))
    def realpart(self):
        h=self.h 
        w=self.w
        l=self.l
        result = []
        placed = True
        for rec in l :  
            if placed == False:
                break
            placed = False
            i=0
            j=self.slots.qsize()
            temp=[]
            while i<j:
                slot=self.slots.get()
                x=slot[0]
                y=slot[1]
                if self.israngeempty(x,y,rec[0],rec[1]):
                    result.append((x,y,rec[2],rec[0],rec[1]))
                    self.rangefull(x,y,rec[0],rec[1])
                    if y+rec[0]<h:
                        for i in range(x,x+rec[1]):
                            self.slots.put((i,y+rec[0])) if not self.grid[i][y+rec[0]] else None
                    if x+rec[1]<w:
                        for i in range(y,y+rec[0]):
                            self.slots.put((x+rec[1],i)) if not self.grid[x+rec[1]][i] else None
                    placed = True
                    break
                else:
                    temp.append(slot)
                i+=1
            for i in temp:
                self.slots.put(i)

        if placed:
            return result
        else:
            return False

    def rangefull(self,x,y,h,w):
        for i in range(x,x+w):
            for j in range(y,y+h):
                self.grid[i][j] = 1

    def israngeempty(self,x,y,h,w):  
        try:
            for i in range(x,x+w):
                y1=y
                y2=y+h-1
                if self.grid[i][y2] or self.grid[i][y1]:
                    return False
            for i in range(y,y+h):
                x1=x
                x2=x+w-1
                if self.grid[x1][i] or self.grid[x2][i]:
                    return False
            return True
        except:
            return False
def permute(l):
    if len(l)==1:
        return [l]
    ans=[]
    for i in range(len(l)):
            temp=l.copy()
            temp.pop(i)
            for j in permute(temp):
                j.append(l[i])
                ans.append(j)
    
    return ans
    
def area(l):
    result = 0
    for rec in l:
        result += rec[0] * rec[1]

    return result

def grid_finding(sorted_list):
    start=time.perf_counter_ns()
    w = sum(rec[1] for rec in sorted_list)
    # print(sorted_list)
    maxh = sorted_list[0][0]
    # print(maxh,w)
    h = maxh
    s = place(h,w,sorted_list)
    s=s.realpart()
    # print("***")
    if s==False:
        return []
    w=max([rec[0]+rec[-1] for rec in s])
    minarea = w*h
    maxw = max(rec[1] for rec in sorted_list)
    totalarea = area(sorted_list)
    sol = s
    si=True
    
    while w >= maxw:
        now=time.perf_counter_ns()
        if now-start>10**9*240:
            break
        # print(w,h,si)
        if not si:
            h+=max(totalarea//w+1,h//100+1)
        else:
            w-=1+(w-1)//100
        if w*h<totalarea:
            si=False
            continue
        elif w*h>=minarea:
            si=True
            continue
        s=place(h,w,sorted_list)
        s=s.realpart()
        if s==False:
            si=False
            continue
        si=True
        minarea=w*h
        sol=s
            

    return sol


a=open("input.txt","r")
b=a.readlines()
a.close()
c=[]
e=[]
for i in b:
    name,width,height=i.split()
    c.append([int(height),int(width),name])
    e.append([int(width),int(height),name])
are=area(c)
c=sorted(c, key=lambda x: x[0], reverse=True)
d=grid_finding(c)
maxw=max([rec[0]+rec[-1] for rec in d])
maxh=max([rec[1]+rec[-2] for rec in d])
if len(c)<=100:
    e=sorted(e, key=lambda x: x[0], reverse=True)
    # print(e)
    f=grid_finding(e)
    g=[]
    for rec in f:
        g.append([rec[1],rec[0],rec[2],rec[-1],rec[-2]])
    maxwg=max([rec[0]+rec[-1] for rec in g])
    maxhg=max([rec[1]+rec[-2] for rec in g])
    if maxwg*maxhg<maxw*maxh:
        d=g
        maxw=maxwg
        maxh=maxhg
if len(c)<9:
    permutations=permute(c)
    for permutation in permutations:
        f=grid_finding(permutation)
        if f==[]:
            continue
        g=[]
        for rec in f:
            g.append([rec[1],rec[0],rec[2],rec[-1],rec[-2]])
        maxwg=max([rec[0]+rec[-1] for rec in g])
        maxhg=max([rec[1]+rec[-2] for rec in g])
        if maxwg*maxhg<maxw*maxh:
            d=g
            maxw=maxwg
            maxh=maxhg
d=sorted(d,key=lambda x:int(x[2][1:]))
# print(d)
a=open("output.txt","w")
ar=maxw*maxh
print(are/ar*100)
a.write(f'bounding_box {maxw} {maxh}\n')
for i in d:
    a.write(str(i[2])+" "+str(i[0])+" "+str(i[1])+"\n")
a.close()
