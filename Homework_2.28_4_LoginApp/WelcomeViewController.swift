//
//  WelcomeViewController.swift
//  Homework_2.28_4_LoginApp
//
//  Created by Ravil on 20.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome \(username!)!"
        
        logOutButton.layer.cornerRadius = 10
    }
}
