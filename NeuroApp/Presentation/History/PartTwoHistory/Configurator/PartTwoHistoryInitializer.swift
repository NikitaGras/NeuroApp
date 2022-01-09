//
//  PartTwoHistoryPartTwoHistoryInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartTwoHistoryModuleInitializer: NSObject {
    @IBOutlet weak var parttwohistoryViewController: PartTwoHistoryViewController!

    override func awakeFromNib() {
        let configurator = PartTwoHistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: parttwohistoryViewController)
    }
}
