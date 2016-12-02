type Node[T] = ref object
  data:T
  next:Node[T]


proc makeNode[T](data: T, next:Node[T]): Node[T] =
  Node[T](data: data, next:next)

proc copyList[T](first:Node[T], last:Node[T]):Node[T]=
    if(first == nil): 
        result = nil    
    else:
        var
            prev = makeNode(first.data)
            head = prev
            current = first.next
            newCurrent : Node[T]

        while(current != last):
            newCurrent = makeNode(current.data)
            prev.next = newCurrent
            prev = newCurrent
            current = current.next
        result = head
    

proc traverse[T](first:Node[T], last:Node[T])=
    var node = first
    while(node != last):
        echo node.data
        node = node.next


var node1 = makeNode(5, nil)
var node2 = makeNode(6, node1)

var node = node2
traverse(node, nil)

var newList = copyList(node, node1)
traverse(newList, nil)
traverse(copyList[int](nil,nil), nil)
traverse(copyList(node2, nil), nil)
