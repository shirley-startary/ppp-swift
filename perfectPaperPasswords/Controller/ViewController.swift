//
//  ViewController.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 02/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginEmailField: UITextField!
    @IBOutlet weak var loginPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmailField.becomeFirstResponder()
        loginPasswordField.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if self.loginEmailField.text == "" || self.loginPasswordField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Por favor introduce usuario y contraseña", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
        }
        
        if self.loginEmailField.text != "example" || self.loginPasswordField.text != "123456" {
            let alertController = UIAlertController(title: "Error", message: "El usuario o contraseña no coinciden con una cuenta válida", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)

        } else {
            loginPasswordField.text = ""
            loginEmailField.text = ""
            self.performSegue(withIdentifier: "home", sender: homeViewController.self)
        }
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        print("Hola")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

