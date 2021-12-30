//
//  PartOneHistoryTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.12.2021.
//

import UIKit

class PartOneHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    func fill(with answer: PartOneAnswer, number: Int) {
        questionLabel.text = "\(number.description). '\(answer.questionText)'"
        answerLabel.text = "\(String.History.yourAnswer): \(answer.value.description)"
    }
}
