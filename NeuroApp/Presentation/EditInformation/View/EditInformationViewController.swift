//
//  EditInformationEditInformationViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class EditInformationViewController: UIViewController, EditInformationViewInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var output: EditInformationViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: EditInformationViewInput
    func setupInitialState() {
    }
    
    func fill(with user: User) {
        nameTextField.text = user.name
        ageTextField.text = user.age.description
        emailTextField.text = user.email
    }
    
    @IBAction func save(_ sender: Any) {
        output.safeUser()
    }
    
    // TODO: remake
    func createUser() throws -> User {
        let name = nameTextField.text ?? ""
        let ageString = ageTextField.text ?? ""
        let age = Int(ageString) ?? 0
        let email = emailTextField.text ?? ""
        let user = try User(with: name, age, email)
        return user
    }
}
