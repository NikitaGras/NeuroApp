//
//  HistoryMainHistoryMainViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit
import Charts

class HistoryMainViewController: UIViewController, HistoryMainViewInput {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyHistoryLabel: UILabel!
    
    var output: HistoryMainViewOutput!
    var displayManager: HistoryMainDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: HistoryMainViewInput
    func setupInitialState() {
        displayManager = HistoryMainDisplayManager(tableView)
        displayManager.delegate = self
        titleLabel.text = String.Score.yourRecentScore
        emptyHistoryLabel.text = String.History.empty
    }
    
    func setup(with history: [Result]) {
        contentView.isHidden = false
        displayManager.set(history: history)
    }
    
    func showEmptyHistory() {
        contentView.isHidden = true
    }
}

extension HistoryMainViewController: HistoryMainDisplayManagerDelegate {
    func displayManager(_ displayManger: HistoryMainDisplayManager, didSelectResult result: Result) {
        output.show(result: result)
    }
}
