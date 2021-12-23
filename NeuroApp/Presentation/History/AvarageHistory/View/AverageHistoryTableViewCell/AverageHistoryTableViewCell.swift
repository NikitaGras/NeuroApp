//
//  AverageHistoryTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.12.2021.
//

import UIKit

class AverageHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    private func setupInitialState() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 4
    }
    
    func fill(with score: (key: String, value: Int)) {
        titleLabel.text = score.key
        scoreLabel.text = score.value.description
    }
}
