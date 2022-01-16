//
//  PartThreeHistoryDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10.01.2022.
//

import UIKit

class PartThreeHistoryDisplayManager: NSObject {
    private let tableView: UITableView
    private let headerView = AverageHistoryHeaderView()
    
    private var answer: PartThreeAnswer?
    
    init (_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        tableView.tableHeaderView = headerView
    }
    
    func update(with result: Result) {
        self.answer = result.partThreeAnswer
        tableView.reloadData()
        
        headerView.update(with: result, scoreLabelTitle: String.Score.partThreeDescription)
    }
    
}

extension PartThreeHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartThreeHistoryTableViewCell.identifier) as? PartThreeHistoryTableViewCell
        if let answer = answer {
            cell?.fill(with: answer)
        }
        return cell ?? UITableViewCell()
    }
}

extension PartThreeHistoryDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 230
    }
}
