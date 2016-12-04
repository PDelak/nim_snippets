# this module implements set in terms of list
import list

type Set*[T] = List[T]

type SNode*[T] = Node[T]

proc makeSet*[T](node:SNode[T]):Set[T] = makeList(node)

proc insert*[T](set:Set[T], data:T):Set[T] = pushFront(set, data)

proc traverseSet*[T](set:Set[T], p:proc(node:SNode[T])) = traverse(set, p)

when isMainModule:
    var set = makeSet[int](nil).insert(10).insert(20)
    var visitor = proc(n : SNode[int]) = echo n.data
    traverseSet(set, visitor)