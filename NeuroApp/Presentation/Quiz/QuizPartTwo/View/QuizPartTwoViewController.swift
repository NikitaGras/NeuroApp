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
    
    var output: QuizPartTwoViewOutput!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: - QuizPartTwoViewInput
    func setupInitialState() {
    }
    
    func show(imageOptions: [ImageOption]) {
        
    }
    
    func show(stringOptions: [StringOption]) {
        
    }
}
