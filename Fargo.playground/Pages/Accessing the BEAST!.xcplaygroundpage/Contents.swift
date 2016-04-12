//: [Previous](@previous)
//: # Accessing your data
import Foundation

// : Define the operator
infix operator <| {
    associativity left
    precedence 150
}

// : Define a decodable protocol
public protocol Decodable {
    typealias DecodedType = Self
    static func decode(json: AnyObject) -> Optional<Self>
}

// : Make a string decodeable
extension String : Decodable {
    public static func decode(j:AnyObject) -> Optional<String> {
        if let j = j as? String {
            return .Some(j)
        }
        return .None
    }
}

// : How the operator actually works.
public func <| <T where T: Decodable, T == T.DecodedType>(json: AnyObject, key:String) -> T? {
    if let dictionary = json as? NSDictionary {
        return T.decode(dictionary[key]!)
    }
    return .None
}

// : Pull a value out of the JSON data
let firstName:String? = json <| "firstName"


infix operator <|| { associativity left precedence 150 }

func <|| <T where T: Decodable, T == T.DecodedType>(json: AnyObject, key:String) -> [T]? {
    if let dictionary = json as? NSDictionary {
        if let array = dictionary[key] as? NSArray {
            return array.map { T.decode($0)! }
        }
        return .None
    }
    return .None
}

let groups:[String]? = json <|| "groups"

//: [Next](@next)
