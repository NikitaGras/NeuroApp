//
//  QuizPartThreeQuizPartThreeViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartThreeViewController: UIViewController, QuizPartThreeViewInput {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: PlaceholderTextView!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet weak var progressViewStack: ProgressViewStack!
    
    var output: QuizPartThreeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: QuizPartThreeViewInput
    func setupInitialState() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        nextButton.setTitle(String.Button.next, for: .normal)
        answerTextView.placeholderText = String.PartThreeQuiz.placeholder
    }
    
    func show(question: PartThreeQuestion) {
        questionLabel.text = question
    }
    
    func setupProgressBar(viewsNumber: Int, currentIndex: Int, startValue: Int) {
        progressBar.setup(numberOfViews: viewsNumber, currentIndex: currentIndex, startFrom: startValue)
    }
    
    func setupProgressViewStack(with quiz: Quiz) {
        progressViewStack.setup(with: quiz)
    }
    
    func moveProgressBar() {
        progressBar.goForward()
    }
    
    @IBAction func next(sender: RoundButton) {
        let text = answerTextView.text ?? ""
        output.save(userText: text)
    }
}
