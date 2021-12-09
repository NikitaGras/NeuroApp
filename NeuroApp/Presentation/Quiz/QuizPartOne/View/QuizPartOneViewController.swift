//
//  QuizPartOneQuizPartOneViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartOneViewController: UIViewController, QuizPartOneViewInput {
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet var scaleDescriptionLabels: [UILabel]!
    @IBOutlet var scaleLabels: [UILabel]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressTabBar: ProgressTabBar!
    @IBOutlet weak var progressViewStack: ProgressViewStack!
    
    var output: QuizPartOneViewOutput!
    var questions: [PartOneQuestion] {
        return output.questions
    }
    var currentQuestionIndex: Int {
        return output.currentQuestionIndex
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: - QuizPartOneViewInput
    func setupInitialState() {
        navigationController?.isNavigationBarHidden = true
        taskLabel.text = .PartOneQuiz.taskText
        scaleDescriptionLabels.forEach { label in
            if label.tag == 0 {
                label.text = String.PartOneQuiz.leftScaleDescription
            } else if label.tag == 1 {
                label.text = String.PartOneQuiz.centerScaleDescription
            } else if label.tag == 2 {
                label.text = String.PartOneQuiz.rightScaleDescription
            }
        }
        setupScaleLabels(with: slider)
        nextButton.setTitle(.Button.next, for: .normal)
    }
    
    func setupProgressBar() {
        progressTabBar.setup(numberOfViews: questions.count,
                             currentIndex: currentQuestionIndex,
                             startFrom: 0)
        let quizPartsNumber = 3
        progressViewStack.setup(progressViewsNumber: quizPartsNumber,
                                currentProgressViewIndex: 0,
                                questionsNumber: questions.count,
                                currentQuestionIndex: currentQuestionIndex)
    }
    
    func show(_ question: PartOneQuestion) {
        questionLabel.text = question.text
    }
    
    @IBAction func next(_ sender: Any) {
        if let questionText = questionLabel.text {
            let value = Int(slider.value)
            let answer = PartOneAnswer(questionText: questionText, value: value)
            output.save(answer)
        }
    }
    
    func fillProgressbar() {
        progressTabBar.goForward()
        progressViewStack.fill()
    }
    
    @IBAction func slide(_ sender: UISlider) {
        setupScaleLabels(with: sender)
    }
    
    func setupScaleLabels(with slider: UISlider) {
        let value = Int(slider.value)
        scaleLabels.forEach { label in
            label.font = UIFont.systemFont(ofSize: 20.0)
            if Int(label.text ?? "") == value {
                label.font = UIFont.boldSystemFont(ofSize: 25.0)
            }
        }
    }
}
