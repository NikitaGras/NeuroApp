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
    @IBOutlet weak var progressTabBar: ProgressTabBar!
    @IBOutlet weak var progressViewStack: ProgressViewStack!
    
    var output: QuizPartThreeViewOutput!
    var previousPartQuestionsCount: Int {
        return output.previousPartQuestionsCount
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: QuizPartThreeViewInput
    func setupInitialState() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        nextButton.setTitle(String.Button.next, for: .normal)
        nextButton.setBackgroundColor(UIColor.NAGray, for: .disabled)
        answerTextView.placeholderText = String.PartThreeQuiz.placeholder
    }
    
    func show(question: PartThreeQuestion) {
        questionLabel.text = question
    }
    
    func setupProgressBar() {
        progressTabBar.setup(numberOfViews: 1, currentIndex: 0, startFrom: previousPartQuestionsCount)
        progressViewStack.setup(progressViewsNumber: 3,
                                currentProgressViewIndex: 2,
                                questionsNumber: 1,
                                currentQuestionIndex: 0)
    }
    
    func fillProgressBar() {
        progressTabBar.goForward()
    }
    
    func setupNextButon(isEnabled: Bool) {
        nextButton.isEnabled = isEnabled
    }
    
    @IBAction func next(sender: RoundButton) {
        nextButton.isEnabled = false
        let text = answerTextView.text ?? ""
        output.save(userText: text)
    }
}
