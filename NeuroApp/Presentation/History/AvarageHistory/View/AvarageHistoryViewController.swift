//
//  AvarageHistoryAvarageHistoryViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class AvarageHistoryViewController: UIViewController, AvarageHistoryViewInput {
    @IBOutlet weak var tableView: UITableView!
    var output: AvarageHistoryViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: AvarageHistoryViewInput
    func setupInitialState() {
    }
}
