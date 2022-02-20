//
//  ExportExportInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class ExportModuleInitializer: NSObject {
    @IBOutlet weak var exportViewController: ExportViewController!

    override func awakeFromNib() {
        let configurator = ExportModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: exportViewController)
    }

}
