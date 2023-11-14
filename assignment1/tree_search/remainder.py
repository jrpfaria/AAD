import itertools

from tree_search import *

def all_pairs(lst):
    if len(lst) < 2:
        yield []
        return
    if len(lst) % 2 == 1:
        # Handle odd length list
        for i in range(len(lst)):
            for result in all_pairs(lst[:i] + lst[i+1:]):
                yield result
    else:
        a = lst[0]
        for i in range(1,len(lst)):
            pair = frozenset((a,lst[i]))
            for rest in all_pairs(lst[1:i]+lst[i+1:]):
                yield [pair] + rest

def func_actions(state):
    pairings = []
    for eq in state:
        pairings.append(list(all_pairs(eq)))
    actions = list(itertools.product(*pairings))
    return actions

def func_result(state, action):
    action = list(action)
    new_state = action
    for i in range(len(state)):
        for j in range(len(state[i])):
            found = False
            for k in range(len(action[i])):
                if state[i][j] in action[i][k]:
                    found = True
            if not found:
                new_state[i].append(frozenset((state[i][j],)))
    return new_state

def func_cost(state,newstate):
    xors = set()
    for eq in newstate[1]:
        for xor in eq:
            if len(xor)!=1:
                xors.add(xor)
    return len(xors)

def func_satisfies(state):
    for eq in state:
        if len(eq)!=1:
            return False
    return True

class Remainder(SearchDomain):
    def __init__(self):
        pass
    def actions(self,state):
        return func_actions(state)
    def result(self,state,action):
        return func_result(state,action)
    def cost(self,state,action):
        return func_cost(state,action)
    def heuristic(self,state,goal):
        return 0
    def satisfies(self,state,goal):
        return func_satisfies(state)
