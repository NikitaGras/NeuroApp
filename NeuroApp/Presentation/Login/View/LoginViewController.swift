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
    
    var output: LoginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
    
    @IBAction func save(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let ageString = ageTextField.text ?? ""
        let age: Int = Int(ageString) ?? -1
        let email = emailTextField.text ?? ""
        let user = User(name: name, age: age, email: email)
        output.save(user)
    }
}
