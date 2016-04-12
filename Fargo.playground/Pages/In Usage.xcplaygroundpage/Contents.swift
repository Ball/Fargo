//: [Previous](@previous)
//: # In actuall usage
import Foundation

extension User : Decodable {
    static func create(firstName:String)(lastName:String)(accountId: Int)(groups: [String]) -> User {
        return User(firstName: firstName, lastName: lastName, accountId: accountId, groups: groups)
    }
    public static func decode(j: AnyObject) -> Optional<User> {
        return User.create
            <^> j <| "firstName"
            <*> j <| "lastName"
            <*> j <| "accountId"
            <*> j <|| "groups"
    }
}

if let user = User.decode(json) {
    user.firstName
    user.lastName
    user.accountId
    user.groups
    
}
