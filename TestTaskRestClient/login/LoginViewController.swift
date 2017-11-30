//
//  LoginViewController.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import TwitterKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController, CallbackToken {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var buttonConstrein: NSLayoutConstraint!
    @IBAction func login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UsersList")
        self.present(controller, animated: true, completion: nil)
        
        
//        if (!Reachability.isConnectedToNetwork()){
//            UIAlertController.notInternet(controler: self)
//            return
//        }
//        api.login(auth:
//            AuthModel(userName: userName.text!,
//                      password: password.text!,
//                      email: email.text!),
//                  delegate: self)
        
    }
    @IBAction func faceBookAuth(_ sender: Any) {
        loginFB()
    }
    @IBAction func twitterAuth(_ sender: Any) {
        loginTwitter()
    }
    
    let api : ApiManager = ApiManager()

    func loginTwitter() {
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: self)
            return
        }
        if (Twitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
            let session = Twitter.sharedInstance().sessionStore.session()
            self.api.authTwitter(token: (session?.authToken)!,
                                 tokenSecret: (session?.authTokenSecret)!,
                                 delegate: self)
        } else {
            Twitter.sharedInstance().logIn { session, error in
                if session != nil {
                    self.api.authTwitter(token: (session?.authToken)!,
                                         tokenSecret: (session?.authTokenSecret)!,
                                         delegate: self)
                } else {
                   UIAlertController.errorLoginTwitter(controler: self)
                }
            }
        }
    }
    
    func loginFB() {
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: self)
            return
        }
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ReadPermission.publicProfile,ReadPermission.userFriends], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.api.authFB(token: accessToken.authenticationToken, delegate: self)
                print("Logged in!")
            }
        }
    }
    
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
    override func viewDidLoad() {
     
    }
}
