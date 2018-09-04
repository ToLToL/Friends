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
        
        facebookLoginButton.delegate = self
        facebookLoginButton.readPermissions = ["email", "user_friends", "public_profile"]
        facebookLoginButton.loginBehavior = .web
        
        //MARK: - INIT BUTTONS -
        
        /*let fbLoginButton = FBSDKLoginButton()
        
        fbLoginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
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
        
        let displayFriendsTabViewButton: UIButton =  {
            
            let button = UIButton(type: .system)
            
            button.backgroundColor = .green
            button.frame = CGRect(x: 16, y: 182, width: view.frame.width - 32, height: 50)
            button.setTitle("Display Friends Tab View", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(displayFriendsTabView), for: .touchUpInside)
            
            return button
        }()
        
        //MARK: - ADD SUBVIEWS -
        
        view.addSubview(fbLoginButton)
        view.addSubview(displayFriendsInfoButton)
        view.addSubview(displayFriendsTabViewButton)
        
        //MARK: - OTHER SETTINGS -
        
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email", "user_friends", "public_profile"]
        fbLoginButton.loginBehavior = .web*/
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
    }
}

