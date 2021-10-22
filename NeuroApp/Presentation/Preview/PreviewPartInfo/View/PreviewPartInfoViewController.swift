//
//  PreviewPartInfoPreviewPartInfoViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewPartInfoViewController: UIViewController, PreviewPartInfoViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: RoundButton!
    
    var output: PreviewPartInfoViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: - PreviewPartInfoViewInput
    func setupInitialState() {
        nextButton.setTitle(.Button.ok, for: .normal)
    }
    
    func update(with state: Quiz.State) {
        if state == .partOneProceed {
            titleLabel.text = .Preview.partOneTitle
            infoLabel.text = .Preview.partOneInfo
        } else if state == .partTwoProceed {
            titleLabel.text = .Preview.partTwoTitle
            infoLabel.text = .Preview.partTwoInfo
        } else if state == .partThreeProceed {
            titleLabel.text = .Preview.partThreeTitle
            infoLabel.text = .Preview.partThreeInfo
        }
    }
    
    @IBAction func next(_ sender: Any) {
        output.next()
    }
}
