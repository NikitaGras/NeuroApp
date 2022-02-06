//
//  InformationInformationInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class InformationModuleInitializer: NSObject {
    @IBOutlet weak var informationViewController: InformationViewController!

    override func awakeFromNib() {
        let configurator = InformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: informationViewController)
    }
}
