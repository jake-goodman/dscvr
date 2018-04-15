//
//  DscvrNavigationViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/14/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class DscvrNavigationViewController: UINavigationController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.topItem?.title = "Dscvr"
        self.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "norwester", size: 24.0),
            .foregroundColor: UIColor.white]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
