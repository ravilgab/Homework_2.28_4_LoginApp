//
//  ViewController.swift
//  Homework_2.28_4_LoginApp
//
//  Created by Ravil on 20.11.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let usernamePlaceholder = NSAttributedString(
        string: "Username",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
    )
    
    private let passwordPlaceholder = NSAttributedString(
        string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.attributedPlaceholder = usernamePlaceholder
        passwordTF.attributedPlaceholder = passwordPlaceholder
    }


}

