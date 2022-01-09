//
//  PartTwoHistoryDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04.01.2022.
//

import UIKit

class PartTwoHistoryDisplayManager: NSObject {
    private let tableView: UITableView
    private let headerView = AverageHistoryHeaderView()
    
    private var answers: [PartTwoAnswer] = []
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: PartTwoHistoryTableViewCell.self)
        tableView.tableHeaderView = headerView
    }
    
    func update(with result: Result) {
        answers = result.partTwoAnswers
        tableView.reloadData()
        headerView.update(with: result)
    }
    
    
}

extension PartTwoHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartTwoHistoryTableViewCell.identifier) as? PartTwoHistoryTableViewCell
        cell?.fill(with: answers[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension PartTwoHistoryDisplayManager: UITableViewDelegate {
    
}
