//: [Previous](@previous)
//: # Map and Apply are Friends

func someCurriedFunction(a: Int)(_ b:String)(_ c:Int) -> String {
    return "\(a) \(b) \(c) = \(a + c)"
}

//: becase of the order of operations...
someCurriedFunction <^> .Some(1) <*> .Some("+") <*> .Some(2)

//: is the same as
((someCurriedFunction <^> .Some(1)) <*> .Some("+")) <*> .Some(2)

//: And any .None collapses the whole shebang.
someCurriedFunction <^> .Some(1) <*> .None <*> .Some(1)

//: [Next](@next)