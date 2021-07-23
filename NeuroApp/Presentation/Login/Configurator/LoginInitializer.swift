//
//  LoginLoginInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
