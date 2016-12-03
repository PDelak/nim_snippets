import lists

type TreeNode[T] = ref object
  data:T
  left:TreeNode[T]
  right:TreeNode[T]


proc makeNode[T](data:T, left:TreeNode[T], right:TreeNode[T]) : TreeNode[T]
    = TreeNode[T](data:data, left:left, right:right)

proc VisitInOrder[T](node:TreeNode[T]) = 
    if(node != nil):
        VisitInOrder(node.left)
        echo(node.data)
        VisitInOrder(node.right)



proc find[T](node:TreeNode[T], data:T):TreeNode[T] =
    var stack:DoublyLinkedList[T]
    var current = node
    while(current != nil):
        if(data < current.data):
            current = current.left
        elif(data > current.data):
            current = current.right
        elif(data == current.data):
            break
    result = current

proc path[T](node:TreeNode[T], data:T):DoublyLinkedList[TreeNode[T]] =
    var stack:DoublyLinkedList[TreeNode[T]]
    var current = node
    while(current != nil):
        stack.prepend(current)
        if(data < current.data):
            current = current.left
        elif(data > current.data):
            current = current.right
        elif(data == current.data):
            break
    result = stack



var left = makeNode(2, nil, nil)
var right = makeNode(10, nil, nil)
var root = makeNode(5, left, right)

VisitInOrder(root)

var n = find(root, 2)

if n != nil: echo n.data

echo "path:"

var p = path(root,10)

for e in p : echo e.data
