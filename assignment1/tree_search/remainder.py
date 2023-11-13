import itertools

from tree_search import *

def func_actions(state):
    perms = []
    for s in state:
        perms.append(list(itertools.permutations(s)))
    return list(itertools.product(*perms))

def func_result(state, action):
    new_state = []
    end = 0
    for i in range(len(state)):
        new_state.append([])
        parity = len(action[i])%2
        end = len(action[i]) - parity - 1
        for j in range(0,end,2):
            new_state[i].append(frozenset([action[i][j], action[i][j+1]]))
        if parity==1:
            new_state[i].append(frozenset(action[i][end+1]))
    return new_state

def func_cost(state,action):
    xors = set()
    new_state = func_result(state,action)
    for eq in new_state:
            for xor in eq:
                if len(xor)!=1:
                    xors.add(xor)
    last_cost = len(xors)
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
