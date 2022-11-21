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
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    var iconClick = true
    let username = "Tim"
    private let password = "Cook"
    
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
        
        logInButton.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = username
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func showPasswordPressed() {
        if iconClick {
            passwordTF.isSecureTextEntry = false
        } else {
            passwordTF.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        switch sender {
        case forgotUsernameButton:
            let dialogMessage = UIAlertController(
                title: "Oops!",
                message: "Your username is Tim",
                preferredStyle: .alert
            )
            
            let ok = UIAlertAction(title: "Ok", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        case forgotPasswordButton:
            let dialogMessage = UIAlertController(
                title: "Oops!",
                message: "Your password is Cook",
                preferredStyle: .alert
            )
            
            let ok = UIAlertAction(title: "Ok", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        default:
            break
        }
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue, sender: Any?) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func logInButtonPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            wrongCredentials()
            passwordTF.text = ""
        }
    }
    
    private func wrongCredentials() {
        let alert = UIAlertController(title: "Error", message: "Wrong username or password", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
