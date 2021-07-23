//
//  ProfileProfileViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    
    var output: ProfileViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ProfileViewInput
    func setupInitialState() {
    }
    
    func update(_ user: User) {
        
    }
    
    @IBAction func edit(_ sender: UIButton) {
    }
    
    @IBAction func erase(_ sender: Any) {
    }
}
