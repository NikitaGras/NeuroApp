//
//  PreviewPartInfoPreviewPartInfoInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewPartInfoModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var previewpartinfoViewController: PreviewPartInfoViewController!

    override func awakeFromNib() {

        let configurator = PreviewPartInfoModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: previewpartinfoViewController)
    }

}
