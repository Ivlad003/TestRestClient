//
//  User.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/30/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var username: String = ""
    @objc dynamic var last_login: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
