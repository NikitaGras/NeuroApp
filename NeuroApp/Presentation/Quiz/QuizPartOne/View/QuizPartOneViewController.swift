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
    @IBOutlet var scaleLabels: [UILabel]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var questionLabel: UILabel!
    var output: QuizPartOneViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: QuizPartOneViewInput
    func setupInitialState() {
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
}
