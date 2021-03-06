//
//  LoginLoginViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveButton: RoundButton!
    var output: LoginViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: - LoginViewInput
    func setupInitialState() {
        hideKeyboardWhenTapped()
        saveButton.setBackgroundColor(.NAGreen, for: .normal)
    }
    
    @IBAction func save(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let ageString = ageTextField.text ?? ""
        let age: Int = Int(ageString) ?? 0
        let email = emailTextField.text ?? ""
        
        output.saveUser(with: name, age, email)
    }
}
