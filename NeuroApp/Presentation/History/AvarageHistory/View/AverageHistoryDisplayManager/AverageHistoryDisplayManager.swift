//
//  AverageHistoryDisplayManager.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.12.2021.
//

import UIKit

class AverageHistoryDisplayManager: NSObject {
    private let tableView: UITableView
    private let tableHeaderView = AverageHistoryHeaderView()
    
    private var scores: [(key: String, value: Int)] = []
    
    var delegate: AverageHistoryDisplayManagerDelegate?
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: AverageHistoryTableViewCell.self)
        tableView.rowHeight = 80
        tableView.tableHeaderView = tableHeaderView
    }
    
    func setup(with result: Result) {
        var score = (key: String.History.partOneTitle, value: result.partOneScore)
        scores.append(score)
        score = (key: String.History.partTwoTitle, value: result.partOneScore)
        scores.append(score)
        score = (key: String.History.partThreeTitle, value: result.partOneScore)
        scores.append(score)
        
        tableHeaderView.update(with: result)
        
        tableView.reloadData()
    }
}

extension AverageHistoryDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AverageHistoryTableViewCell.identifier) as? AverageHistoryTableViewCell
        let score = scores[indexPath.row]
        cell?.fill(with: score)
        return cell ?? UITableViewCell()
    }
}

extension AverageHistoryDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch scores[indexPath.row].key {
        case String.History.partOneTitle:
            delegate?.didSelectPartOneRow(self)
        case String.History.partTwoTitle:
            delegate?.didSelectPartTwoRow(self)
        case String.History.partThreeTitle:
            delegate?.didSelectPartThreeRow(self)
        default:
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
