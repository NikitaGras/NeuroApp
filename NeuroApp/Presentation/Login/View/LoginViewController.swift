//
//  LoginLoginViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {

    var output: LoginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
}
