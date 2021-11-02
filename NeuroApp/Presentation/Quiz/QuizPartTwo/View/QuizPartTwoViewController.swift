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

    // MARK: - QuizPartTwoViewInput
    func setupInitialState() {
        nextButton.setTitle(.Button.next, for: .normal)
    }
    
    func show(question: PartTwoQuestion) {
        questionLabel.text = question.text
    }
    
    func show(imageOptions: [ImageOption]) {
        optionView.show(options: imageOptions)
    }
    
    func show(stringOptions: [StringOption]) {

    }
    
    @IBAction func next(_ sender: RoundButton) {
        output.save()
    }
}

extension QuizPartTwoViewController: OptionViewDelegate {
    func optionView(_ optionView: OptionView, selectedOption: Option) {
        output.selectedOption = selectedOption
    }
}
