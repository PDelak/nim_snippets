# this module implements map in terms of list
import list 

type Map*[K,V] = List[tuple[key:K,value:V]]

type Node*[T] = list.Node[T]

proc makeMap*[K,V](node:Node[tuple[key:K,value:V]]):Map[K,V] = makeList(node)

proc insert*[K,V](map:Map[K,V], data:tuple[key:K,value:V]):Map[K,V] = pushFront(map, data)

proc remove*[K,V](map:Map[K,V], data:tuple[key:K,value:V]):Map[K,V] = list.remove(map, data)

proc traverseMap*[K,V](map:Map[K,V], p:proc(node:Node[tuple[key:K,value:V]])) = list.traverse(map, p)

type OpaqueValueBase = ref object of RootObj
  
type OpaqueValue[T] = ref object of OpaqueValueBase
  data:T

proc makeValue[T](value:T):OpaqueValueBase = OpaqueValue[T](data:value)

when isMainModule:
    var map_1 = makeMap[int,int](nil).insert((key:10,value:10)).insert((key:10,value:20))
    var map_2 = map_1.remove((key:10,value:10))
    var visitor = proc(n : Node[(int,int)]) = echo n.data
    traverseMap(map_2, visitor)

    var map_3 = makeMap[int, OpaqueValueBase](nil).insert((key:10, value:makeValue(5)))
                                                  .insert((key:20, value:makeValue("delak")))
 
    var visitor2 = proc(n : Node[(int, OpaqueValueBase)]) = echo n.data

    traverseMap(map_3, visitor2)
