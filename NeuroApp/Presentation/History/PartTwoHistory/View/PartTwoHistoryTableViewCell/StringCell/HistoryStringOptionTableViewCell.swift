//
//  HistoryStringOptionTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 22.02.2022.
//

import UIKit

class HistoryStringOptionTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var stringOptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var responseTimeLabel: UILabel!
    
    func fill(with answer: PartTwoAnswer) {
        questionLabel.text = answer.questionText
        yourAnswerLabel.text = String.History.yourAnswer
        
        setupOptionLabel(with: answer)
    }
    
    func setupOptionLabel(with answer: PartTwoAnswer) {
        stringOptionLabel.text = answer.option.value
        stringOptionLabel.backgroundColor = answer.option.isRight ? UIColor.NAGreen : UIColor.NARed
        stringOptionLabel.layer.masksToBounds = true
        stringOptionLabel.layer.cornerRadius = 25
    }
}
