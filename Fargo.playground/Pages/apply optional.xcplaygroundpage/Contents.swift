//: [Previous](@previous)
//: # Apply Optional
import Foundation

infix operator <*> {
    associativity left
    precedence 100
}
func <*><T,U>(f:Optional<T -> U>, value: Optional<T> ) -> Optional<U> {
    return f.flatMap( {  value.map($0) })
}

let optionalFunc :Optional<Int ->Int> = .Some({ 1 + $0})
let noptionalFunc : Optional<Int -> Int> = .None
let optionalNumber : Int? = 3
let noptionalNumber : Int? = nil

//: Both are real
optionalFunc <*> optionalNumber
//: a .None number
optionalFunc <*> noptionalNumber
//: both are .None
noptionalFunc <*> noptionalNumber
//: a .None function
noptionalFunc <*> optionalNumber

/*:
### Nerd Note:
This makes `Optional<T>` a _applicative_ functor
*/
//: [Next](@next)
