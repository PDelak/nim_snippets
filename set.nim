# this module implements set in terms of list
import list 

type Set*[T] = List[T]

type Node*[T] = list.Node[T]

proc makeSet*[T](node:Node[T]):Set[T] = makeList(node)

proc insert*[T](set:Set[T], data:T):Set[T] = pushFront(set, data)

proc remove*[T](set:Set[T], data:T):Set[T] = list.remove(set, data)

proc traverse*[T](set:Set[T], p:proc(node:Node[T])) = list.traverse(set, p)

when isMainModule:
    var set_1 = makeSet[int](nil).insert(10).insert(20).insert(30)
    var set_2 = set_1.remove(10)
    var visitor = proc(n : Node[int]) = echo n.data
    traverse(set_2, visitor)