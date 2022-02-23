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
        tableView.register(cell: HistoryImageOptionTableViewCell.self)
        tableView.register(cell: HistoryStringOptionTableViewCell.self)
    }
    
    func update(with result: Session) {
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
        if answers[indexPath.row].option is StringOption {
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryStringOptionTableViewCell.identifier) as! HistoryStringOptionTableViewCell
            return cell
        }
        if answers[indexPath.row].option is ImageOption {
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryImageOptionTableViewCell.identifier) as! HistoryImageOptionTableViewCell
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? HistoryImageOptionTableViewCell {
            cell.fill(with: answers[indexPath.row])
        }
        if let cell = cell as? HistoryStringOptionTableViewCell {
            cell.fill(with: answers[indexPath.row])
        }
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
