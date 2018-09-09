//
//  RoundedCorner.swift
//  Friends
//
//  Created by Maxime Gernath on 09/09/2018.
//  Copyright © 2018 Hyokil.KIM/Maxime.GERNATH. All rights reserved.
//

import UIKit

class RoundedCorner: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var radius: Int = 10 {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = CGFloat(radius)
        layer.masksToBounds = true
    }
}
