//
//  HistoryMainHistoryMainInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class HistoryMainModuleInitializer: NSObject {
    @IBOutlet weak var historymainViewController: HistoryMainViewController!

    override func awakeFromNib() {
        let configurator = HistoryMainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: historymainViewController)
    }

}
