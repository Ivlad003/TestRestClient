//
//  UsersListViewController+Delegats.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    // Пока тестово так на время пока исправляют Api
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 10
    }
    
    // Пока тестово так на время пока исправляют Api
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(indexPath.row) \(indexPath.row)"
        return cell
    }
}

