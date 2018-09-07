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

class LoginViewController: UIViewController, CNContactPickerDelegate, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Actions -
    
    @IBAction func tappedSendSMS(_ sender: Any) {
        
        if (MFMessageComposeViewController.canSendText() &&
            ContactsList.shared.selectedContactsInfo != nil) {
            
            let controller = MFMessageComposeViewController()
            var phoneNumberList: [String]?
            
            for element in ContactsList.shared.selectedContactsInfo! {
                if phoneNumberList == nil {
                    phoneNumberList = [element.value]
                } else {
                    phoneNumberList?.append(element.value)
                }
            }
            controller.body = "Sent from Friends app"
            controller.recipients = phoneNumberList
            controller.messageComposeDelegate = self
            present(controller, animated: true, completion: nil)
        }
    }
    
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
    
    //MARK: - Send message functions -

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        dismiss(animated: true, completion: nil)
    }
}

