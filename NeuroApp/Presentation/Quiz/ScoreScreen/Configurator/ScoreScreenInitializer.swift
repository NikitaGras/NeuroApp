//
//  ScoreScreenScoreScreenInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ScoreScreenModuleInitializer: NSObject {
    @IBOutlet weak var scorescreenViewController: ScoreScreenViewController!

    override func awakeFromNib() {
        let configurator = ScoreScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: scorescreenViewController)
    }
}
