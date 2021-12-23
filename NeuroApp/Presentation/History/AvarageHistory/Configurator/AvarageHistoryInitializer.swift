//
//  AvarageHistoryAvarageHistoryInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class AvarageHistoryModuleInitializer: NSObject {
    @IBOutlet weak var avaragehistoryViewController: AverageHistoryViewController!

    override func awakeFromNib() {
        let configurator = AvarageHistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: avaragehistoryViewController)
    }

}
