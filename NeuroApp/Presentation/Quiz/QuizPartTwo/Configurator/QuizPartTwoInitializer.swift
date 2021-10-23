//
//  QuizPartTwoQuizPartTwoInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartTwoModuleInitializer: NSObject {
    @IBOutlet weak var quizparttwoViewController: QuizPartTwoViewController!

    override func awakeFromNib() {

        let configurator = QuizPartTwoModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: quizparttwoViewController)
    }

}
