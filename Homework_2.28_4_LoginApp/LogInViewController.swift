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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = usernameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
        sender.tag == 10
            ? showAlert(title: "Oops!", message: "Username is Tim")
            : showAlert(title: "Oops!", message: "Password is Cook")
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue, sender: Any?) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func logInButtonPressed() {
        guard usernameTF.text == username, passwordTF.text == password else {
            showAlert(
                title: "Oops",
                message: "Wrong username or password!",
                textField: passwordTF
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
