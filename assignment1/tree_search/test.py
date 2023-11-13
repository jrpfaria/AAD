from remainder import *
import itertools

equations = [[1,2,3],[4,5,6],[7,8,9],[1,2,4]]
initial = []
for i in range(len(equations)):
    initial.append([])
    for j in equations[i]:
        initial[i].append(frozenset([j]))

print(initial)
p = Remainder()

state = initial
for i in range(3):
    print("\nstep")
    print("state",state)
    actions = p.actions(state)
    a = actions[0]
    print("action",a)
    c = p.cost(state,a)
    print("cost",c)
    state = p.result(state,a)
    if p.satisfies(state,1):
        print("\ngoal achieved")
        break

print("end")
print(state)
