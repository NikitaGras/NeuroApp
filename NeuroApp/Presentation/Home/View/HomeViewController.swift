//
//  HomeHomeViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    @IBOutlet weak var quizButton: RoundButton!
    @IBOutlet weak var statusView: UserStatusView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var output: HomeViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - HomeViewInput
    func setupInitialState() {
        quizButton.setBackgroundColor(.NAGray, for: .disabled)
        quizButton.setBackgroundColor(.NABlue, for: .normal)
        quizButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func update(with quiz: Quiz) {
        if quiz.state == .begin {
            let title = String.QuizState.begin
            quizButton.isEnabled = true
            quizButton.setTitle(title, for: .normal)
        } else if quiz.state == .notAvailable {
            quizButton.isEnabled = false
            output.startTimer()
        } else if quiz.isProceed {
            let title = String.QuizState.proceed
            quizButton.isEnabled = true
            quizButton.setTitle(title, for: .normal)
        }
    }
    
    func update(with user: User) {
        statusLabel.text = user.status.description
        statusView.setBorderColor(for: user.status)
    }
    
    func setupButtonTitle(with timeInterval: TimeInterval) {
        let title = timeInterval.description + " " + String.QuizState.notAvailable
        quizButton.setTitle(title, for: .disabled)
    }
    
    @IBAction func examine(_ sender: RoundButton) {
        output.openQuiz()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backButtonTitle = String.Button.backHome
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
