//
//  UIAlertControllerFactory.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func notInternet(controler: UIViewController){
        let alert = UIAlertController(title: "Not Internet", message: "Not Internet conection.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action -> Void in
            alert.dismiss(animated: false, completion: nil)
        })
        controler.present(alert, animated: false, completion: nil)
    }
    
    class func errorLoginTwitter(controler: UIViewController){
        let alert = UIAlertController(title: "No Twitter Accounts Available", message: "You must log in before presenting a login app.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action -> Void in
            alert.dismiss(animated: false, completion: nil)
        })
        controler.present(alert, animated: false, completion: nil)
    }
    
    class func errorMessage(controler: UIViewController,message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action -> Void in
            alert.dismiss(animated: false, completion: nil)
        })
        controler.present(alert, animated: false, completion: nil)
    }
}
