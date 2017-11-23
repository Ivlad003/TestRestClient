//
//  RegistrationViewController.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, CallbackToken {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var buttonConstrein: NSLayoutConstraint!
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submit(_ sender: Any) {
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: self)
            return
        }
        api.registration(reg:
            AuthModel(userName: userName.text!,
                      password: password.text!,
                      email: email.text!),
                         delegate: self)
    }
    let api : ApiManager = ApiManager()
    
    func token(token: String, error: String) {
        if !token.isEmpty{
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: "token")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "UsersList")
            self.present(controller, animated: true, completion: nil)
        } else{
            UIAlertController.errorMessage(controler: self, message: error)
        }
    }
}
