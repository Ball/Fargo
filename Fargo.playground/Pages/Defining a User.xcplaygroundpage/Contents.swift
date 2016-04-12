//: [Previous](@previous)

struct User {
    let firstName : String
    let lastName: String
    let accountId: Int
    let groups : [String]
    var fullName: String { get { return "\(firstName) \(lastName)" } }
}

/*:
Basically, we want to take the following Json:

    { "user": { "firstName": "Brian", "lastName": "Ball", "accountId": 7, "groupds": ["Congo Alumns", "Forum Mobile", "Swift"]} }

and Generate the struct:

    User(firstName: "Brian", lastName:"Ball", accountId: 7, groups: ["Congo Alumns", "Forum Mobile", "Swift"])
*/
//: [Next](@next)
