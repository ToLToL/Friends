//
//  UserInfo.swift
//  Friends
//
//  Created by ToLToL on 05/09/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import Foundation

class ContactsList {
    
    static let shared = ContactsList()
    
    var selectedContactsInfo: [String: String]?
    
    private init() {}
}
