//
//  PreviewPreviewInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewModuleInitializer: NSObject {
    //Connect with object on storyboard
    @IBOutlet weak var previewViewController: PreviewViewController!

    override func awakeFromNib() {

        let configurator = PreviewModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: previewViewController)
    }
}
