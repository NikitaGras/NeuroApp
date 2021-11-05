//
//  QuizPartThreeQuizPartThreeViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartThreeViewController: UIViewController, QuizPartThreeViewInput {

    var output: QuizPartThreeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: QuizPartThreeViewInput
    func setupInitialState() {
    }
}
