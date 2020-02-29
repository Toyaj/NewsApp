//
//  UIView + Extension.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
