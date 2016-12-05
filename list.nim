# file contains implementation of persistent list

# two main operations are :
# pushFront
# remove

type Node*[T] = ref object
  data*:T
  next:Node[T]

type List*[T] = ref object
  head:Node[T]

#create a new node
proc makeNode*[T](data: T, next:Node[T]): Node[T] = Node[T](data: data, next:next)

#create a list passing node as parameter
proc makeList*[T](head:Node[T]):List[T] = List[T](head:head)

proc makeList*[T]():List[T] = List[T](head:nil)

#adds element to front
#always returns a new list
proc pushFront*[T](list:List[T], data:T):List[T] = 
        var newList = makeList[T](nil)
        var next = list.head
        var node =  makeNode(data, next)      
        newList.head = node        
        result = newList

# find specific element in list
proc find*[T](list:List[T], data:T):Node[T] =
    var node = list.head
    while(node != nil):
        if(node.data == data):break
        node = node.next    
    result = node

# copies a range [first,last) and returns a pair (head, last copied node)
proc copyList*[T](first:Node[T], last:Node[T]):tuple[first:Node[T], last:Node[T]]=
    if(first == nil): 
        result = (first:nil,last:nil)    
    else:
        var
            prev = makeNode(first.data, nil)
            head = prev
            current = first.next
            newCurrent : Node[T] = prev

        while(current != last):
            newCurrent = makeNode(current.data, nil)
            prev.next = newCurrent
            prev = newCurrent
            current = current.next
        result = (first:head, last:newCurrent)
    
    
proc remove*[T](list:List[T], data:T):List[T]  =
    var node = list.find(data)
    # list empty case
    if (node == nil):         
        result = makeList[T](nil)
    # list with one element case
    elif (list.head.data == data):
        var head = list.head.next
        result = makeList[T](head)        
    # list with more than one element
    else:
        var listRange = copyList(list.head, node);
        listRange.last.next = node.next
        result = makeList[T](listRange.first)        


# traverses range [first,last) and calls p (Node[T]) for each node
proc traverse*[T](first:Node[T], last:Node[T], p:proc(node:Node[T]))=
    var node = first
    while(node != last):
        p(node)
        node = node.next

# traverses whole list
proc traverse*[T](list:List[T], p:proc(node:Node[T]))=
    traverse(list.head, nil, p)


proc traverseCallback[T](node:Node[T]) = echo node.data

when isMainModule:

    var list_1 = makeList[int]().pushFront(10).pushFront(20).pushFront(30)

    var list_2 = list_1.pushFront(40)

    assert(list_1.find(10) != nil)
    assert(list_1.find(20) != nil)
    assert(list_1.find(30) != nil)
    assert(list_1.find(40) == nil)

    assert(list_2.find(40) != nil)
    assert(list_2.find(10) != nil)
    assert(list_2.find(20) != nil)
    assert(list_2.find(30) != nil)

    var list_3 = list_2.remove(10)
    assert(list_3.find(10) == nil)
    assert(list_3.find(20) != nil)
    assert(list_3.find(30) != nil)
    assert(list_3.find(40) != nil)
