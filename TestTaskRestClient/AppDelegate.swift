//
//  AppDelegate.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Twitter.sharedInstance()
            .start(withConsumerKey:"fEAr7giBN9fmTgI3sbsnOmr5w",consumerSecret:"YGyGW2cXgLsukepU9zn3gjPAzyyHzLeqv4nKnoTGWH7yAwlv3i")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return Twitter.sharedInstance().application(app, open: url, options: options)
    }
}
