//
//  PreviewBaseInfoPreviewBaseInfoViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewBaseInfoViewController: UIViewController, PreviewBaseInfoViewInput {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: RoundButton!
    
    var output: PreviewBaseInfoViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - PreviewBaseInfoViewInput
    func setupInitialState() {
        nextButton.setTitle(.Button.begin, for: .normal)
    }
    
    func update(with state: Quiz.State) {
        if state == .begin {
            infoLabel.text = .Preview.beginInfo
        }
    }
    
    @IBAction func next(_ sender: Any) {
        output.next()
    }
}
