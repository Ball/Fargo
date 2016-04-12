import Foundation


let jsonNSData = "{ \"firstName\": \"Brian\", \"lastName\": \"Ball\", \"accountId\": 7, \"groups\": [\"Swift\", \"Congo Alumns\", \"Forum Mobile\"]}".dataUsingEncoding(NSUTF8StringEncoding)
public let json : AnyObject = try! NSJSONSerialization.JSONObjectWithData(jsonNSData!, options: [])

public struct User {
    public let firstName : String
    public let lastName: String
    public let accountId: Int
    public let groups: [String]
    public var fullName: String { get { return "\(firstName) \(lastName)" } }
    public init(firstName: String, lastName:String, accountId: Int, groups:[String]){
        self.firstName = firstName
        self.lastName = lastName
        self.accountId = accountId
        self.groups = groups
    }
}
infix operator <^> { associativity left precedence 100 }
infix operator <*> { associativity left precedence 100 }
public func <^><T,U>(f: T -> U, value: Optional<T>) -> Optional<U>{ return value.map(f) }
public func <*><T,U>(f:Optional<T -> U>, value: Optional<T> ) -> Optional<U> { return f.flatMap( {  value.map($0) }) }
infix operator <| { associativity left precedence 150 }
infix operator <|| { associativity left precedence 150 }
public protocol Decodable {
    typealias DecodedType = Self
    static func decode(json: AnyObject) -> Optional<Self>
}
extension String : Decodable {
    public static func decode(j:AnyObject) -> Optional<String> {
        if let j = j as? String {
            return .Some(j)
        }
        return .None
    }
}
extension Int: Decodable {
    public static func decode(j:AnyObject) -> Optional<Int> {
        if let j = j as? Int {
            return .Some(j)
        }
        return .None
    }
}
public func <| <T where T: Decodable, T == T.DecodedType>(json: AnyObject, key:String) -> T? {
    if let dictionary = json as? NSDictionary {
        return T.decode(dictionary[key]!)
    }
    return .None
}
public func <|| <T where T: Decodable, T == T.DecodedType>(json: AnyObject, key:String) -> [T]? {
    if let dictionary = json as? NSDictionary {
        if let array = dictionary[key] as? NSArray {
            return array.map { T.decode($0)! }
        }
        return .None
    }
    return .None
}
