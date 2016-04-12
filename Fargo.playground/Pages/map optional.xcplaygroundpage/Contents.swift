//: [Previous](@previous)
/*:
We will use some functional concepts to make it happen.  We are going to use `map` aka `<^>` and
`apply` aka `<*>` to help simplify working with Optional types

# Map optional

A function can be mapped over an optional value
*/
import Foundation

infix operator <^> {
    associativity left
    precedence 100
}

func <^><T,U>(f: T -> U, value: Optional<T>) -> Optional<U>{
    return value.map(f)
}

let optional3 : Optional<Int> = .Some(3)
let optionalNone :Optional<Int> = .None

let _ = optional3.map { 2 + $0 }
optionalNone.map { 2 + $0 }

//: a function to map
func desc(a:AnyObject) -> String {
    return a.description
}
desc <^> optional3
desc <^> optionalNone

/*:
### Nerd Note:
This makes `Optional<T>` a functor
*/
//: [Next](@next)
