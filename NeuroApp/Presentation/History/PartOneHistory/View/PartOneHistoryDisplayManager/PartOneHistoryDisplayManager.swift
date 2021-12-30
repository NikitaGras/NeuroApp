//
//  PartOneHistoryDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.12.2021.
//

import UIKit

class PartOneHistoryDisplayManager: NSObject {
    let tableView: UITableView
    private var answers: [PartOneAnswer] = []
    
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
    }
    
    func update(with answers: [PartOneAnswer]) {
        self.answers = answers
        tableView.reloadData()
    }
}


extension PartOneHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartOneHistoryTableViewCell.identifier) as? PartOneHistoryTableViewCell
        cell?.fill(with: answers[indexPath.row], number: indexPath.row + 1)
        return cell ?? UITableViewCell()
    }
}

extension PartOneHistoryDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
