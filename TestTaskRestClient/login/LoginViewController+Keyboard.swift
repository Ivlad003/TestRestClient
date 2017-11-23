//
//  LoginViewController+Keyboard.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import Foundation
import UIKit

//Закрывает клавитуру при клике на пустое место и поднимает вю конда клава открыта.
extension LoginViewController{
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: Notification.Name.UIKeyboardWillShow, object: nil)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(someAction(sender:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func someAction(sender:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillAppear() {
        buttonConstrein.constant = 250.0
    }
    
    @objc func keyboardWillDisappear() {
        buttonConstrein.constant = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
}
