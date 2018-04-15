//
//  UIView+Extension.swift
//  dscvr
//
//  Created by Jake Goodman on 4/11/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

extension UIView {
    func showRoundedCorners(show: Bool, cornerRadius: CGFloat = 3) {
        layer.cornerRadius = show ? cornerRadius : 0
        layer.masksToBounds = true
    }
    
    func showBorder(width: CGFloat = 1.0, color: UIColor = .black) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
