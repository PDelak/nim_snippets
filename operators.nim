type basic = ref object

type syntax = ref object
  d:int

type _ = ref object
  assoc:int


proc `?`(a:syntax): syntax =
  var d:syntax = syntax(d:10)
  result = d

proc `*`(a:syntax): syntax =
  var d:syntax = syntax(d:10)
  result = d

proc `*`(a:syntax, b:_): syntax =
  var d:syntax = syntax(d:10)
  result = d

proc `+`(a:syntax): syntax =
  var d:syntax = syntax(d:10)
  result = d

proc `||||`(a:syntax, b:syntax): syntax =
  var d:syntax = syntax(d:10)
  result = d

var d1 = syntax(d:10)
var d2 = syntax(d:10)
var expr = ?d1
var statement = *expr 
var z = statement |||| expr 

