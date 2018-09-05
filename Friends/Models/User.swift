//
//  UserInfo.swift
//  Friends
//
//  Created by ToLToL on 05/09/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import Foundation

class User {
    
    static let shared = User()
    
    var name: String?
    var email: String?
    var picture: String?
    
    private init() {}
    
}
