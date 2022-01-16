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
//        tableView.tableHeaderView = headerView
    }
    
    func update(with result: Result) {
        answers = result.partTwoAnswers
        tableView.reloadData()
        headerView.update(with: result, scoreLabelTitle: String.Score.partTwoDescription)
    }
    
    
}

extension PartTwoHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartTwoHistoryTableViewCell.identifier)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as? PartTwoHistoryTableViewCell
        cell?.fill(with: answers[indexPath.row])
    }
}

extension PartTwoHistoryDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return 230
    }
}
