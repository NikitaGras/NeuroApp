//
//  PartTwoHistoryPartTwoHistoryViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartTwoHistoryViewController: UIViewController, PartTwoHistoryViewInput {
    @IBOutlet weak var tableView: UITableView!
    
    var output: PartTwoHistoryViewOutput!
    var displayManager: PartTwoHistoryDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.setupTableHeaderViewHeight()
    }

    // MARK: PartTwoHistoryViewInput
    func setupInitialState() {
        displayManager = PartTwoHistoryDisplayManager(tableView)
        displayManager.update(with: output.result)
    }
}
