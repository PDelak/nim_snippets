import lists

type TreeNode[T] = ref object
  data:T
  left:TreeNode[T]
  right:TreeNode[T]


type Tree[T] = ref object
  root : TreeNode[T]

proc makeNode[T](data:T, left:TreeNode[T], right:TreeNode[T]) : TreeNode[T]
    = TreeNode[T](data:data, left:left, right:right)

proc makeTree[T]() : Tree[T]=
    Tree[T](root:nil)

proc path[T](node:TreeNode[T], data:T):system.seq[TreeNode[T]] =
    var stack:system.seq[TreeNode[T]] = @[]
    var current = node
    while(current != nil):
        stack.add(current)
        if(data < current.data)    : current = current.left
        elif(data > current.data)  : current = current.right
        elif(data == current.data) : break
    result = stack

 
proc insert[T](node:TreeNode[T], data:T):TreeNode[T]=
    var current = node
    if(current == nil): result = makeNode[T](data, nil, nil)
    else:
        var parent = current
        while(current != nil):
            parent = current
            if(data < current.data)    : current = current.left
            elif(data > current.data)  : current = current.right
            elif(data == current.data) : break
        if(data < parent.data):
            parent.left = makeNode[T](data, nil, nil)
        else:
            parent.right = makeNode[T](data, nil, nil)
        result = node

proc insert[T](tree:Tree[T], data:T)=
    tree.root = insert(tree.root, data)


proc VisitInOrder[T](node:TreeNode[T]) = 
    if(node != nil):
        VisitInOrder(node.left)
        echo(node.data)
        VisitInOrder(node.right)



proc find[T](node:TreeNode[T], data:T):TreeNode[T] =
    var current = node
    while(current != nil):
        if(data < current.data)    : current = current.left
        elif(data > current.data)  : current = current.right
        elif(data == current.data) : break
    result = current


var left = makeNode(2, nil, nil)
var right = makeNode(10, nil, nil)
var root = makeNode(5, left, right)

VisitInOrder(root)

var n = find(root, 2)

if n != nil: echo n.data

echo "path:" & ":"

var p = path(root,10)

for e in p : echo e.data

var tree = makeTree[int]()
tree.insert(10)
tree.insert(20)
tree.insert(30)
echo "tree.visit"

VisitInOrder(tree.root)