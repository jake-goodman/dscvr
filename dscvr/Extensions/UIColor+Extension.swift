//
//  UIColor+Extension.swift
//  dscvr
//
//  Created by Jake Goodman on 4/14/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
