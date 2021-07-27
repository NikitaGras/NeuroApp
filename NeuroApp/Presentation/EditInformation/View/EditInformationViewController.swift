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

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EditInformationViewInput
    func setupInitialState() {
    }
    
    @IBAction func save(_ sender: Any) {
    }
}
