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
       
        let fbLoginButton = FBSDKLoginButton()
        let inviteFriendsbutton: UIButton =  {
        
            let button = UIButton(type: .system)
            button.backgroundColor = .green
            button.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
            button.setTitle("Invite Friends", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.white, for: .normal)
            return button
        }()
        
        fbLoginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        view.addSubview(fbLoginButton)
        view.addSubview(inviteFriendsbutton)
        
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email", "user_friends", "public_profile"]
        fbLoginButton.loginBehavior = .web
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        //FBSDKAccessToken.setCurrent(nil)
        //FBSDKProfile.setCurrent(nil)
        print("Did log out of Facebook")
    }
    
    func loginButton(_ logeeeeeeeeeeeeeeeeeeeeeeereeeeeeeeeeeeeeeinButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged in with facebook")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            
            if error != nil {
                print("Failed to start graph request:", error!)
                return
            }
    
            print(result!)
            
            FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields": "id, first_name, last_name, name"]).start(completionHandler: { (connection, result, error) in
                
                if error != nil {
                    print("Failed to start graph request:", error!)
                    return
                }
                
                let data = result as! [String: Any]
                print(data)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

