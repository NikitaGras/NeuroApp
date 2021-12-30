//
//  PartOneHistoryPartOneHistoryViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PartOneHistoryViewController: UIViewController, PartOneHistoryViewInput {
    @IBOutlet weak var tableView: UITableView!
    
    var output: PartOneHistoryViewOutput!
    var displayManager: PartOneHistoryDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: PartOneHistoryViewInput
    func setupInitialState() {
        displayManager = PartOneHistoryDisplayManager(tableView)
        displayManager.update(with: output.result.partOneAnswers)
    }
}
