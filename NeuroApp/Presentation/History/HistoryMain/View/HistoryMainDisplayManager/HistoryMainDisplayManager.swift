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
    
    struct Appearance {
        static let rowHeight: CGFloat = 80
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(cell: HistoryMainTableViewCell.self)
        tableView.register(HistoryHeaderView.self, forHeaderFooterViewReuseIdentifier: HistoryHeaderView.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = Appearance.rowHeight
        tableView.isEditing = false
    }
    
    func set(history: [Result]) {
        self.history = history
        tableView.reloadData()
        tableView.frame.size.height = CGFloat(history.count) * Appearance.rowHeight
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryHeaderView.identifier) as! HistoryHeaderView
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = (tableView.bounds.width - 2 * HistoryHeaderView.Appearance.margin) * 3 / 4 + HistoryHeaderView.Appearance.margin * 2 + HistoryHeaderView.Appearance.labelHeight
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.displayManager(self, didSelectResult: history[indexPath.row])
    }
}
