//
//  HomeHomeViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    @IBOutlet weak var questionnaireButton: UIButton!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var output: HomeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: HomeViewInput
    func setupInitialState() {
        statusView.layer.borderWidth = 4
        statusView.layer.cornerRadius = 20
    }
    
    func update(with quiz: Quiz) {
        updateQuestionnaireButton(with: quiz.state)
        updateStatus(with: quiz.userStatus)
    }
    
    func updateQuestionnaireButton(with state: QuestionnaireState) {
        let title = state.buttonTitle
        questionnaireButton.setTitle(title, for: .normal)
        let color = state.backgroundColor
        questionnaireButton.setBackgroundColor(color, for: .normal)
    }
    
    func updateStatus(with status: UserStatus) {
        statusView.layer.borderColor = status.borderColor.cgColor
        statusLabel.text = status.text
    }
    
    @IBAction func examine(_ sender: UIButton) {
        output.openQuiz()
    }
}
