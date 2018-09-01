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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: - INIT BUTTONS -
        
        let fbLoginButton = FBSDKLoginButton()
        let displayFriendsInfoButton: UIButton =  {
        
            let button = UIButton(type: .system)
            button.backgroundColor = .green
            button.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
            button.setTitle("Display Friends Info", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(displayFriendsInfo), for: .touchUpInside)
            return button
        }()
        fbLoginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        //MARK: - ADD SUBVIEWS -
        
        view.addSubview(fbLoginButton)
        view.addSubview(displayFriendsInfoButton)
        
        //MARK: - OTHER SETTINGS -
        
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email", "user_friends", "public_profile"]
        fbLoginButton.loginBehavior = .web
    }
    
    //MARK: - Display Info Methods -
    
    @objc func displayFriendsInfo() {
        
        FacebookSDK.request(path: "/me/friends", parameters: ["fields": "picture.width(250).height(250), id, first_name, last_name, name"])
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
        FacebookSDK.request(path: "/me", parameters: ["fields": "id, name, email"])
    }
}

