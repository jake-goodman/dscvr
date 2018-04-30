//
//  BrowseViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/21/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    fileprivate enum Constants {
        static let featuredHeaderHeight: CGFloat = 50.0
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Browse"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
