//
//  QuizPartOneQuizPartOneInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartOneModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var quizpartoneViewController: QuizPartOneViewController!

    override func awakeFromNib() {

        let configurator = QuizPartOneModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: quizpartoneViewController)
    }

}
