//
//  LoginViewController.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-15.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var messageCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblMessage.text = "No Draft Messages"
        if messageCount > 0 {
            lblMessage.text = "You have \(messageCount) draft messages."
        }
    }
    
    @IBOutlet weak var lblMessage: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
