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
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn: Bool = true
    
    @IBAction func tappedSignInSelector(_ sender: UISegmentedControl) {
        
        isSignIn = !isSignIn
        
        if isSignIn {
            signInLabel.text = "Sign in"
            signInButton.setTitle("Sign in", for: .normal)
        } else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func tappedSignInRegisterButton(_ sender: Any) {
        
        if let mail = emailTextField.text, let password = passwordTextField.text {
            
            // If Sign in is selected
            if isSignIn {
                Auth.auth().signIn(withEmail: mail, password: password) { (user, error) in
                    
                    if user != nil {
                        
                        self.performSegue(withIdentifier: "goToMainMenu", sender: self)
                    } else {
                        print("Sign in error: \(String(describing: error))")
                    }
                }
            }
                
            // If Resgister is selected
            else {
                Auth.auth().createUser(withEmail: mail, password: password) { (user, error) in
                    
                    if user != nil {
                        
                        self.performSegue(withIdentifier: "goToMainMenu", sender: self)
                    } else {
                        print("Resgister error: \(String(describing: error))")
                    }
                }
                
            }
        }
    }
    
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
