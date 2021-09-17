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

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - HomeViewInput
    func setupInitialState() {
        statusView.layer.borderWidth = 4
        statusView.layer.cornerRadius = 20
    }
    
    func update(with quiz: Quiz) {
        updateQuizButton(with: quiz)
    }
    
    func update(with user: User) {
        updateStatus(with: user)
    }
    
    func updateQuizButton(with quiz: Quiz) {
        // TODO:
    }
    
    func updateStatus(with user: User) {
        // TODO: 
    }
    
    @IBAction func examine(_ sender: UIButton) {
        output.openQuiz()
    }
}
