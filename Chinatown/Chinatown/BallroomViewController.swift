//
//  BallroomViewController.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/14/22.
//

import UIKit

class BallroomViewController: UIViewController {

    @IBAction func link(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.instagram.com/ar/558986898787916/")! as URL, options: [:], completionHandler: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
