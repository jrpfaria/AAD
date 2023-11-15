from remainder import *
from my_tree_search import *
import numpy as np

eq = []
eq.append([((0,5),(7,13)),((1,3),12)])
eq.append([((1,3),(2,4)),((5,7),(6,13)),(11,15)])
eq.append([((1,3),(2,4)),((0,5),(10,12)),(6,14)])
eq.append([((7,9),(11,15)),((2,4),12)])
eq.append([((1,3),(6,14)),((8,10),11)])
eq.append([((0,5),(7,13)),((9,10),2)])
eq.append([((0,5),(7,13)),((3,6),(4,8)),(9,15)])
eq.append([((2,4),(6,13)),((0,1),(8,14))])

#combinations = (list(itertools.combinations(range(0,16),2)))
#combinations = (list(itertools.combinations(combinations,2)))
#combinations = (list(itertools.combinations(combinations,2)))
count = {}
for e in eq:
    for xor in e:
        if xor not in count.keys():
            count[xor] = 0
        count[xor] = count[xor] +1

#count.sort( reverse=True)
for c in count.keys():
    if count[c]!=0:
        print(c,count[c])