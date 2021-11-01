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
    
    @IBOutlet var imageAnswers: [UIImageView]!
    @IBOutlet var stringAnswers: [UILabel]!
    
    @IBOutlet weak var stringOptionsView: UIView!
    @IBOutlet weak var imageOptionsView: UIView!
    
    var output: QuizPartTwoViewOutput!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: - QuizPartTwoViewInput
    func setupInitialState() {
        nextButton.setTitle(.Button.next, for: .normal)
        
        imageAnswers.forEach { imageAnswer in
            let gesture = UITapGestureRecognizer(target: self, action: #selector(selectOption(_:)))
            imageAnswer.addGestureRecognizer(gesture)
        }
    }
    
    func show(question: PartTwoQuestion) {
        questionLabel.text = question.text
    }
    
    func show(imageOptions: [ImageOption]) {
        stringOptionsView.isHidden = true
        imageOptionsView.isHidden = false
        
        imageAnswers.forEach { imageView in
            imageView.image = imageOptions[imageView.tag].asImage()
        }
    }
    
    func show(stringOptions: [StringOption]) {
        stringOptionsView.isHidden = false
        imageOptionsView.isHidden = true
        
        stringAnswers.enumerated().forEach { index,label in
            label.text = stringOptions[index].value
        }
    }
    
    @IBAction func next(_ sender: RoundButton) {
        output.save()
    }
    
    @objc func selectOption(_ sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        output.selectedOptionIndex = index
    }
}
