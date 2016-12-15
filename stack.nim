# this module implements stack in terms of list
import list 

type Stack*[T] = List[T]

type Node*[T] = list.Node[T]

proc makeStack*[T](node:Node[T]):Stack[T] = makeList(node)

proc push*[T](stack:Stack[T], data:T):Stack[T] = pushFront(stack, data)

proc pop*[T](stack:Stack[T]):Stack[T] = 
    if (stack.head == nil):         
        result = makeStack[T](nil)
    else:
        var head = stack.head.next
        result = makeStack[T](head)     

proc traverseStack[T](stack:Stack[T], p:proc(node:Node[T])) = list.traverse(stack, p)

when isMainModule:
    var stack_1 = makeStack[int](nil).push(10).push(20).push(30)
    var stack_2 = stack_1.pop().pop().pop().pop()
    var stack_3 = stack_2.push(60)
    var visitor = proc(n : Node[int]) = echo n.data
    traverseStack(stack_3, visitor)