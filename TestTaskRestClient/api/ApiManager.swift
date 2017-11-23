//
//  ApiManager.swift
//  TestTaskRestClient
//
//  Created by Vlad Kosmach on 11/23/17.
//  Copyright © 2017 Vlad Kosmach. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiManager{
    let host = "http://46.101.73.111:7000"
    
    func login(auth: AuthModel,delegate: CallbackToken){
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: delegate as! UIViewController)
            return
        }
        
        let parameters: [String: String] = [
            "username" : auth.userName,
            "password" : auth.password,
            "email" : auth.email]
        
        Alamofire.request(host+"/authorization/login/",method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: [:])
            .responseJSON {response in
                self.tokenParse(response: response,delegate: delegate)
        }
    }
    
    func registration(reg: AuthModel,delegate: CallbackToken){
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: delegate as! UIViewController)
            return
        }
        let parameters: [String: String] = [
            "username" : reg.userName,
            "password" : reg.password,
            "email" : reg.email]
        
        Alamofire.request(host+"/authorization/registration/",method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: [:])
            .responseJSON {response in
               self.tokenParse(response: response,delegate: delegate)
        }
    }
    
    func authFB(token: String,delegate: CallbackToken){
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: delegate as! UIViewController)
            return
        }
        
        let parameters: [String: String] = [
            "facebook_access_token" : token]
        
        Alamofire.request(host+"/authorization/authorization_with_facebook/",method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: [:])
            .responseJSON {response in
               self.tokenParse(response: response,delegate: delegate)
        }
    }
    
    // Пока не работает Api :(
    func authTwitter(token: String,tokenSecret: String,delegate: CallbackToken){
        if (!Reachability.isConnectedToNetwork()){
            UIAlertController.notInternet(controler: delegate as! UIViewController)
            return
        }
        let parameters: [String: String] = [
            "twitter_access_token_secret" : tokenSecret,
            "twitter_access_token" : token]
        
        Alamofire.request(host+"/authorization/authorization_with_twitter/",method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
            .responseJSON {response in
                self.tokenParse(response: response,delegate: delegate)
        }
    }
    
    // Пока не работает Api :(
    func users(){
        if (!Reachability.isConnectedToNetwork()){
            return
        }
        let headers: [String: String] = [
            "Authorization" : "Token"]
        
        Alamofire.request(host+"/authorization/all_users/",method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers)
            .responseJSON {response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
        }
    }
    
    func tokenParse(response: DataResponse<Any>,delegate: CallbackToken){
        switch response.result {
        case .success(let data):
            print(data)
            let json = JSON(data)
            print(json)
            var error = ""
        
            // Так же не понял поповоду ошыбок :(
            for (key, vul) in json.dictionary!{
                let str = "\n\(key) \(vul)"
                error.append(str)
            }
            //End
            
            // Не совсем понял почмеу в одном месте token, а в другом key :(
            var token = ""
            if json["key"].stringValue.isEmpty {
                token = json["token"].stringValue
            } else {
                token = json["key"].stringValue
            }
            //End
            
            delegate.token(token: token , error: error)
            
        case .failure(let error):
            print("Request failed with error: \(error)")
        }
    }
}
