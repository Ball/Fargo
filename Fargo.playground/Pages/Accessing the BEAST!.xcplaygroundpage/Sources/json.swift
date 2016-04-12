import Foundation

import Foundation

public let jsonString = "{ \"firstName\": \"Brian\", \"lastName\": \"Ball\", \"accountId\": 7, \"groups\": [\"Swift\", \"Congo Alumns\", \"Forum Mobile\"]}"
//: It will be NSData when we get it from the NSUrlSession
public let jsonNSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
//: And we can deserialize it!
public let json : AnyObject = try! NSJSONSerialization.JSONObjectWithData(jsonNSData!, options: [])