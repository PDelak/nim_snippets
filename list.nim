type Node[T] = ref object
  data:T
  next:Node[T]

type List[T] = ref object
  head:Node[T]

#create a new node
proc makeNode[T](data: T, next:Node[T]): Node[T] = Node[T](data: data, next:next)

#create a list passing node as parameter
proc makeList[T](head:Node[T]):List[T] = List[T](head:head)

#adds element to front
proc pushFront[T](list:List[T], data:T) = 
        var next = list.head
        var node =  makeNode(data, next)      
        list.head = node

# copies a range [first,last) and returns a head to
# new created list
proc copyList[T](first:Node[T], last:Node[T]):Node[T]=
    if(first == nil): 
        result = nil    
    else:
        var
            prev = makeNode(first.data, nil)
            head = prev
            current = first.next
            newCurrent : Node[T]

        while(current != last):
            newCurrent = makeNode(current.data, nil)
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

var list = makeList[int](nil)

list.pushFront(10)
list.pushFront(20)

traverse(list.head, nil)
