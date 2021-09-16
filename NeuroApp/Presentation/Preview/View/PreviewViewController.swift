//
//  PreviewPreviewViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

//TODO: ScrollView, Отступы если title скрыт

class PreviewViewController: UIViewController, PreviewViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var output: PreviewViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - PreviewViewInput
    func setupInitialState() {
    }
    
    func showStartScreen(_ quiz: Quiz) {
        titleLabel.isHidden = true
        if quiz.state == .begin {
            infoLabel.text = .Preview.beginInfo
        }
    }
    
    func showPart(_ quiz: Quiz) {
        titleLabel.isHidden = false
        if quiz.state == .partOneProceed {
            titleLabel.text = .Preview.partOneTitle
            infoLabel.text = .Preview.partOneInfo
        } else if quiz.state == .partTwoProceed {
            titleLabel.text = .Preview.partTwoTitle
            infoLabel.text = .Preview.partTwoInfo
        } else if quiz.state == .partThreeProceed {
            titleLabel.text = .Preview.partThreeTitle
            infoLabel.text = .Preview.partThreeInfo
        }
        
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.begin()
    }
}
