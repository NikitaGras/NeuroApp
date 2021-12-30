//
//  HistoryMainDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import UIKit

class HistoryMainDisplayManager: NSObject {
    private let tableView: UITableView
    var headerView: HistoryHeaderView = HistoryHeaderView()
    
    private var history: [Result] = []
    
    weak var delegate: HistoryMainDisplayManagerDelegate?
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(cell: HistoryMainTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = false
        let rowHeight: CGFloat = 80
        tableView.rowHeight = rowHeight
        tableView.tableHeaderView = headerView
        headerView.frame.size.height = 1
    }
    
    func set(history: [Result]) {
        self.history = history
        headerView.updateChartView(with: history)
        tableView.reloadData()
    }
}

extension HistoryMainDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = HistoryMainTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? HistoryMainTableViewCell
        cell?.fill(with: history[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension HistoryMainDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.displayManager(self, didSelectResult: history[indexPath.row])
    }
}
