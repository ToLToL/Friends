//
//  ViewController.swift
//  Friends
//
//  Created by ToLToL on 31/08/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Facebook login button settings -
        
        facebookLoginButton.delegate = self
        facebookLoginButton.readPermissions = ["email", "user_friends", "public_profile"]
        facebookLoginButton.loginBehavior = .web
    }
    
    //MARK: - Display Info Methods -
    
    @objc func displayFriendsTabView() {
        
        FacebookSDK.request(path: "/me/friends", parameters: ["fields": "picture.width(250).height(250), id, first_name, last_name, name"]) { (result) in
            print(result)
        }
    }
    
    @objc func displayFriendsInfo() {
        
        FacebookSDK.request(path: "/me/friends", parameters: ["fields": "picture.width(250).height(250), id, first_name, last_name, name"]) { (result) in
            print(result)
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // push WelcomeViewController only when the facebookLogginButton is on "Log in" Status
        
        if identifier == "pushWelcomeViewController" {
            
            let buttonStatus = facebookLoginButton.currentTitle
            
            if buttonStatus == "Log in" {
                return true
            }
            
            return false
        }
        
        return true
    }
    
    //MARK: - Facebook Authentification Methods -
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {

        print("Did log out of Facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged in with facebook")
        FacebookSDK.request(path: "/me", parameters: ["fields": "id, name, email"]) { (result) in
            print(result)
        }
        
        performSegue(withIdentifier: "pushWelcomeViewController", sender: self)
    }
}

