//
//  QuizPartTwoQuizPartTwoViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartTwoViewController: UIViewController, QuizPartTwoViewInput {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var optionView: OptionView!
    
    var output: QuizPartTwoViewOutput!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        output.viewDidLayout()
    }

    // MARK: - QuizPartTwoViewInput
    func setupInitialState() {
        nextButton.setTitle(.Button.next, for: .normal)
        nextButton.setBackgroundColor(UIColor.NAGreen, for: .normal)
        nextButton.setBackgroundColor(UIColor.gray, for: .disabled)
        nextButton.isEnabled = false
        optionView.delegate = self
    }
    
    func show(question: PartTwoQuestion) {
        questionLabel.text = question.text
        nextButton.isEnabled = false
    }
    
    func show(imageOptions: [ImageOption]) {
        optionView.show(options: imageOptions)
    }
    
    func show(stringOptions: [StringOption]) {
        optionView.show(options: stringOptions)
    }
    
    @IBAction func next(_ sender: RoundButton) {
        output.save()
    }
}

extension QuizPartTwoViewController: OptionViewDelegate {
    func optionView(_ view: UIView, selectedOption: Option) {
        output.selectedOption = selectedOption
        nextButton.isEnabled = true
    }
}
