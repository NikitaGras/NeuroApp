//
//  PartOneHistoryDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.12.2021.
//

import UIKit

class PartOneHistoryDisplayManager: NSObject {
    private let tableView: UITableView
    private let headerView = PartOneHistoryHeaderView()
    
    private var result: Result?
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: PartOneHistoryTableViewCell.self)
        // TODO: Определять размер ячейки в зависимости от размера Label
        tableView.rowHeight = 80
//        tableView.tableHeaderView = headerView
    }
    
    func update(with result: Result) {
        self.result = result
        self.headerView.setup(with: result)
        tableView.reloadData()
    }
}


extension PartOneHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.partOneAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartOneHistoryTableViewCell.identifier) as? PartOneHistoryTableViewCell
        let answers: [PartOneAnswer] = result?.partOneAnswers ?? []
        cell?.fill(with: answers[indexPath.row], number: indexPath.row + 1)
        return cell ?? UITableViewCell()
    }
}

extension PartOneHistoryDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
}
