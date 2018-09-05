//
//  WelcomeViewController.swift
//  Friends
//
//  Created by ToLToL on 04/09/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: User.shared.picture!)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            userProfilePicture.image = UIImage(data: imageData)
        }
        userName.text = User.shared.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
