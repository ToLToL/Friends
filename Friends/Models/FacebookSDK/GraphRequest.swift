//
//  GraphRequest.swift
//  Friends
//
//  Created by ToLToL on 31/08/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import Foundation
import FBSDKShareKit

public class FacebookSDK {

    /// Make request to FacebookSDK to retrieve some data
    /// Can get the result as [String: Any] via the completion closure
    
    public static func request(path: String, parameters: [String: Any], completion: @escaping ([String: Any]) -> Void) {
        
        FBSDKGraphRequest(graphPath: path, parameters: parameters).start(completionHandler: { (connection, result, error) in
            
            if error != nil {
                print("Failed to start graph request:", error!)
                return
            }
            
            completion(result as! [String: Any])
        })
    }
}
