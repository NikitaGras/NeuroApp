//
//  AvarageHistoryAvarageHistoryViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class AverageHistoryViewController: UIViewController, AvarageHistoryViewInput, AverageHistoryDisplayManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var output: AvarageHistoryViewOutput!
    var displayManager: AverageHistoryDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.setupTableHeaderViewHeight()
    }

    // MARK: AvarageHistoryViewInput
    func setupInitialState() {
        displayManager = AverageHistoryDisplayManager(tableView)
        displayManager.delegate = self
    }
    
    func setup(with result: Result) {
        displayManager.setup(with: result)
    }
    
    // MARK: AverageHistoryDisplayManagerDelegate
    func didSelectPartOneRow(_ displayManager: AverageHistoryDisplayManager) {
        output.showPartOneResult()
    }
    func didSelectPartTwoRow(_ displayManager: AverageHistoryDisplayManager) {
        output.showPartTwoResult()
    }
    func didSelectPartThreeRow(_ displayManager: AverageHistoryDisplayManager) {
        output.showPartThreeResult()
    }
}
