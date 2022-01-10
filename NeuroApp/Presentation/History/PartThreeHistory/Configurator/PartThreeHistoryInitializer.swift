//
//  PartThreeHistoryPartThreeHistoryInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartThreeHistoryModuleInitializer: NSObject {
    @IBOutlet weak var partthreehistoryViewController: PartThreeHistoryViewController!

    override func awakeFromNib() {
        let configurator = PartThreeHistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partthreehistoryViewController)
    }

}
