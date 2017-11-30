//
//  UsersListViewController.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import RealmSwift

class UsersListViewController: UIViewController, CallbackUsers {
    
    func error(error: Error) {
        UIAlertController.errorMessage(controler: self,
                                       message: error.localizedDescription)
    }
    
    func usersLoaded() {
        loadFromDB()
    }
    
    let api : ApiManager = ApiManager()
    @IBOutlet weak var table: UITableView!
    var users: [User]?
    var notificationToken : NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        api.users(delegate: self)
        loadFromDB()
    }
    
    func loadFromDB(){
        let realm = try! Realm()
        let result = realm.objects(User.self)
        users = Array(result)
        table.reloadData()
    }
}
