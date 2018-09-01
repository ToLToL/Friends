//
//  GraphRequest.swift
//  Friends
//
//  Created by ToLToL on 31/08/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

public class FacebookSDK {

    public static func request(path: String, parameters: [String: Any]) {
        FBSDKGraphRequest(graphPath: path, parameters: parameters).start(completionHandler: { (connection, result, error) in
            
            if error != nil {
                print("Failed to start graph request:", error!)
                return
            }
            
            let data = result as! [String: Any]
            print(data)
        })
    }
}
