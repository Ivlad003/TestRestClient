//
//  CallbackProtocols.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit

protocol CallbackToken{
    func token(token: String, error: String)
}

protocol CallbackUsers{
    func token(users: [NSObject],error: String)
}
