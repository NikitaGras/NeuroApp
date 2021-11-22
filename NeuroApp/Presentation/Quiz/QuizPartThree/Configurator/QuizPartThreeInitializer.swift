//
//  QuizPartThreeQuizPartThreeInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartThreeModuleInitializer: NSObject {
    @IBOutlet weak var quizpartthreeViewController: QuizPartThreeViewController!
    
    override func awakeFromNib() {
        let configurator = QuizPartThreeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: quizpartthreeViewController)
    }

}
