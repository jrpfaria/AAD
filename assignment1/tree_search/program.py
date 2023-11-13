from remainder import *
from my_tree_search import *

eq = []
eq.append([0,1,3,5,7,12,13])
eq.append([1,2,3,4,5,6,7,11,13,15])
eq.append([0,1,2,3,4,5,6,10,12,14])
eq.append([2,4,7,9,11,12,15])
eq.append([1,3,6,8,10,11,14])
eq.append([0,2,5,7,9,10,13])
eq.append([0,3,4,5,6,7,8,9,13,15])
eq.append([0,1,2,4,6,8,13,14])

initial = []
for i in range(len(eq)):
    initial.append([])
    for j in eq[i]:
        initial[i].append(frozenset([j]))

d = Remainder()
p = SearchProblem(d,initial,1)
t = MyTree(p,'breadth',optimize=1)
print(t.search2())
print(t.solution)
