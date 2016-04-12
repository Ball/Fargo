//: [Previous](@previous)
/*:

# Deserializing JSON

*/
import Foundation

let jsonString = "{ \"firstName\": \"Brian\", \"lastName\": \"Ball\", \"accountId\": 7, \"groups\": [\"Swift\", \"Congo Alumns\", \"Forum Mobile\"]}"
//: It will be NSData when we get it from the NSUrlSession
let jsonNSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
//: And we can deserialize it!
let json : AnyObject = try! NSJSONSerialization.JSONObjectWithData(jsonNSData!, options: [])
//: But it's a map, an array, a number, or a string.  We have no type information

//: [Next](@next)
