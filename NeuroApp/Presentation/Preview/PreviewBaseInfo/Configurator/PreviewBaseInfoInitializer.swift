//
//  PreviewBaseInfoPreviewBaseInfoInitializer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewBaseInfoModuleInitializer: NSObject {
    @IBOutlet weak var previewbaseinfoViewController: PreviewBaseInfoViewController!

    override func awakeFromNib() {

        let configurator = PreviewBaseInfoModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: previewbaseinfoViewController)
    }

}
