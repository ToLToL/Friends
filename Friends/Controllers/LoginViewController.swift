//
//  ViewController.swift
//  Friends
//
//  Created by ToLToL on 31/08/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import UIKit
import Firebase
import ContactsUI
import MessageUI

class LoginViewController: UIViewController, CNContactPickerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions -
    
    @IBAction func tappedShowContactsButton(_ sender: Any) {
        
        let picker = CNContactPickerViewController()
        
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    //MARK: - Contact picker functions -
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        
        contacts.forEach { (contact) in
            
            if ContactsList.shared.selectedContactsInfo == nil {
                ContactsList.shared.selectedContactsInfo = [contact.givenName + " " + contact.familyName: contact.phoneNumbers[0].value.stringValue]
           
            } else {
                ContactsList.shared.selectedContactsInfo![contact.givenName + " " + contact.familyName] = contact.phoneNumbers[0].value.stringValue
           }
             print(ContactsList.shared.selectedContactsInfo!)
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        
        print("It cancelled the contact picker view controller when the cancel button is tapped")
    }

    /*override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // push WelcomeViewController only when the facebookLogginButton is on "Log in" Status
        
        if identifier == "pushWelcomeViewController" {
            
            let buttonStatus = facebookLoginButton.currentTitle
            
            if buttonStatus == "Log in" {
                return true
            }
            
            return false
        }
        
        return true
    }*/
}

