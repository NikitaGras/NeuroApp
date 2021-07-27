//
//  EditInformationEditInformationInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class EditInformationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var editinformationViewController: EditInformationViewController!

    override func awakeFromNib() {

        let configurator = EditInformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: editinformationViewController)
    }

}
