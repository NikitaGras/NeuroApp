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
    
    var output: QuizPartOneViewOutput!
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: QuizPartOneViewInput
    func setupInitialState() {
    }
    
    @IBAction func next(_ sender: Any) {
    }
}
