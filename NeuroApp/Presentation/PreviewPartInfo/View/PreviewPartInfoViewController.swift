//
//  PreviewPartInfoPreviewPartInfoViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewPartInfoViewController: UIViewController, PreviewPartInfoViewInput {

    var output: PreviewPartInfoViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PreviewPartInfoViewInput
    func setupInitialState() {
    }
}
