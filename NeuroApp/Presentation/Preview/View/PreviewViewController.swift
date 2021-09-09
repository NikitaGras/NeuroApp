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

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PreviewViewInput
    func setupInitialState() {
    }
    
    func showStartScreen() {
        titleLabel.isHidden = true
        // TODO:
    }
    
    func showPart(_ quiz: Quiz) {
        titleLabel.isHidden = false
        titleLabel.text = quiz.state.previewTitle
        infoLabel.text = quiz.state.previewInfo
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.begin()
    }
}
