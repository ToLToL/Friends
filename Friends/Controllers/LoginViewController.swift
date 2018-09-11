//
//  LoginViewController.swift
//  Friends
//
//  Created by ToLToL on 10/09/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Google sign in delegates
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signOut()
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
        performSegue(withIdentifier: "goToMainMenu", sender: self)
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        
        performSegue(withIdentifier: "goToMainMenu", sender: self)
    }
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
}
