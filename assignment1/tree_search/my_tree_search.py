from tree_search import *
from collections import namedtuple

MyNodeTuple = namedtuple('MyNode','state parent cost heuristic depth')
SearchProblemTuple = namedtuple('SearchProblem','domain initial goal')
SearchDomainTuple = namedtuple('SearchDomain', 'actions result cost heuristic satisfies branching')
 
class MyNode(SearchNode):
    def __init__(self,state,parent,cost=None,heuristic=None,depth=None):
        super().__init__(state,parent)
        self.cost = cost
        self.heuristic = heuristic
        self.depth = depth

class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth',optimize=0,keep=0.25): 
        super().__init__(problem,strategy)
        self.optimize = optimize
        self.keep = keep
        self.current_depth = 0
        if self.optimize>=2:
            domainT = SearchDomainTuple(self.problem[0][0],self.problem[0][1],self.problem[0][2],self.problem[0][3],self.problem[0][4],self.problem[0][5])
            problemT = SearchProblemTuple(domainT,self.problem[1],self.problem[2])
            self.problem = problemT
        if self.optimize>=1:
            root = MyNodeTuple(self.problem.initial, None, 0, self.problem.domain.heuristic(self.problem.initial,self.problem.goal), 0)
        else:
            root = MyNode(problem.initial, None, 0, problem.domain.heuristic(problem.initial,problem.goal), 0)
        self.all_nodes = [root]
        self.open_nodes = [0]
        self.closed_nodes = []

    def astar_add_to_open(self,lnewnodes):
        self.open_nodes.extend(lnewnodes)
        self.open_nodes.sort(key = lambda newnode: self.all_nodes[newnode].cost+self.all_nodes[newnode].heuristic)


    # remove a fraction of open (terminal) nodes
    # with lowest evaluation function
    # (used in Incrementally Bounded A*)
    def forget_worst_terminals(self):
        branching = self.problem.domain.branching
        d = 0
        for nodeID in self.open_nodes:
            d += self.all_nodes[nodeID].depth
        d = d/len(self.open_nodes)
        max_nodes_given_depth = 0
        for i in range(0,int(d)):
            max_nodes_given_depth += branching**(i)
        max_nodes_given_depth += branching**(d)
        NumKeep = self.keep*max_nodes_given_depth
        NumKeep = int(NumKeep)+1
        self.open_nodes = self.open_nodes[0:NumKeep]

    # procurar a solucao
    def search2(self):
        while self.open_nodes != []:
            nodeID = self.open_nodes.pop(0)
            self.closed_nodes.append(nodeID)
            node = self.all_nodes[nodeID]
            if node.depth>self.current_depth:
                self.current_depth = node.depth
                print(self.current_depth)
            if self.optimize>=2:
                if self.problem.domain.satisfies(node.state,self.problem.goal):
                    self.solution = node
                    self.terminals = len(self.open_nodes)+1
                    return self.get_path(node)
            else:
                if self.problem.goal_test(node.state):
                    self.solution = node
                    self.terminals = len(self.open_nodes)+1
                    return self.get_path(node)
            lnewnodes = []
            self.non_terminals += 1
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state,a)
                if newstate not in self.get_path(node):
                    if self.optimize>=1:
                        newnode = MyNodeTuple(newstate,nodeID,node.cost+self.problem.domain.cost(node.state,(node.state,newstate)),self.problem.domain.heuristic(newstate,self.problem.goal),node.depth+1)
                    else:
                        newnode = MyNode(newstate,nodeID,node.cost+self.problem.domain.cost(node.state,(node.state,newstate)),self.problem.domain.heuristic(newstate,self.problem.goal),node.depth+1)
                    flag = True
                    if self.optimize==4:
                        for nID in self.open_nodes:
                            n = self.all_nodes[nID]
                            if n.state==newnode.state:
                                if n.cost>newnode.cost:
                                    self.all_nodes[nID] = newnode
                                flag = False
                        for nID in self.closed_nodes:
                            n = self.all_nodes[nID]
                            if n.state==newnode.state:
                                if n.cost>newnode.cost:
                                    self.all_nodes[nID] = newnode
                                    self.open_nodes.append(nID)
                                flag = False
                    if flag:
                        lnewnodes.append(len(self.all_nodes))
                        self.all_nodes.append(newnode)
            self.add_to_open(lnewnodes)
        return None

# If needed, auxiliary functions can be added

    # juntar novos nos a lista de nos abertos de acordo com a estrategia
    def add_to_open(self,lnewnodes):
        if self.optimize==4 and self.strategy not in [ 'A*', 'IBA*' ]:
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key = lambda newnode: self.all_nodes[newnode].cost)
        else:
            super().add_to_open(lnewnodes)
        if self.strategy=='IBA*':
            self.forget_worst_terminals()