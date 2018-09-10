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
    
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
    
    @IBAction func tappedGoogleSignInButton(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Google sign in delegates
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signOut()
    }
}
