//
//  PartOneHistoryPartOneHistoryInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PartOneHistoryModuleInitializer: NSObject {
    @IBOutlet weak var partonehistoryViewController: PartOneHistoryViewController!

    override func awakeFromNib() {
        let configurator = PartOneHistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partonehistoryViewController)
    }

}
