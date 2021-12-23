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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20))
    }
    
    private func setupInitialState() {
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.NAGray.cgColor
        contentView.layer.borderWidth = 2
    }
    
    func fill(with score: (key: String, value: Int)) {
        titleLabel.text = score.key
        scoreLabel.text = score.value.description
    }
}
