//
//  JsonParser.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/30/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import SwiftyJSON

class JsonParser: NSObject {
    class func users(data :Any) -> [User]{
        let json = JSON(data)
        print(json)
        var users = [User]()
        for jObject in json.arrayValue{
            let user = User()
            user.id = jObject["id"].intValue
            user.username = jObject["username"].stringValue
            user.last_login = jObject["last_login"].stringValue
            users.append(user)
        }
        return users
    }
}
