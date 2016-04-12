import Foundation

infix operator <^> {
    associativity left
    precedence 100
}

public func <^><T,U>(f: T -> U, value: Optional<T>) -> Optional<U>{
    return value.map(f)
}

infix operator <*> {
    associativity left
    precedence 100
}
public func <*><T,U>(f:Optional<T -> U>, value: Optional<T> ) -> Optional<U> {
    return f.flatMap( {  value.map($0) })
}