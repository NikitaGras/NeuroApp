//
//  PartThreeHistoryPartThreeHistoryViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartThreeHistoryViewController: UIViewController, PartThreeHistoryViewInput {
    @IBOutlet weak var tableView: UITableView!
    var output: PartThreeHistoryViewOutput!

    var displayManager: PartThreeHistoryDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.setupTableHeaderViewHeight()
        tableView.tableHeaderView?.frame.size.height = 230
    }

    // MARK: PartThreeHistoryViewInput
    func setupInitialState() {
        displayManager = PartThreeHistoryDisplayManager(tableView)
        displayManager.update(with: output.result)
    }
}
