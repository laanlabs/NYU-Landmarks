//
//  NavViewController.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/15/22.
//

import UIKit

class NavViewController: UINavigationController {

override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.

    //self.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .default)
    //self.navigationBar.shadowImage = UIImage()
    self.navigationBar.isTranslucent = true
    self.navigationBar.backIndicatorImage = UIImage(named: "back")

    //self.navigationBar.tintColor = .white

}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}

}
