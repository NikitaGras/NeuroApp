//
//  HistoryMainDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import UIKit

class HistoryMainDisplayManager: NSObject {
    private let tableView: UITableView
    private var history: [Result] = []
    weak var delegate: HistoryMainDisplayManagerDelegate?
    
    private let identifier = HistoryMainTableViewCell.identifier
    private let rowHeight: CGFloat = 80
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(cell: HistoryMainTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = rowHeight
        tableView.isScrollEnabled = false
        tableView.isEditing = false
    }
    
    func set(history: [Result]) {
        self.history = history
        tableView.reloadData()
        tableView.frame.size.height = CGFloat(history.count) * rowHeight
    }
}

extension HistoryMainDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
