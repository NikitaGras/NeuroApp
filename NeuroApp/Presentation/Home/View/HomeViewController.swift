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
    }
    
    func update(with quiz: Quiz) {
        updateQuizButton(with: quiz)
    }
    
    func update(with user: User) {
        updateStatus(with: user)
    }
    
    func updateQuizButton(with quiz: Quiz) {
        if quiz.state == .begin {
            let title = String.QuizState.begin
            quizButton.isEnabled = true
            quizButton.setTitle(title, for: .normal)
        } else if quiz.state == .notAvailable {
            let title = String.QuizState.notAvailable
            quizButton.isEnabled = false
            quizButton.setTitle(title, for: .disabled)
        } else if quiz.isProceed {
            let title = String.QuizState.proceed
            quizButton.isEnabled = true
            quizButton.setTitle(title, for: .normal)
        }
    }
    
    func updateStatus(with user: User) {
        statusLabel.text = user.status.description
        statusView.setBorderColor(for: user.status)
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
