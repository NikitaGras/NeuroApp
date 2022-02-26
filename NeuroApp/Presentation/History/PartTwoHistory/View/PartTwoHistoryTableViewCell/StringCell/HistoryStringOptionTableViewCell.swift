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
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var responseTimeLabel: UILabel!
    
    func fill(with answer: PartTwoAnswer) {
        questionLabel.text = answer.questionText
        yourAnswerLabel.text = String.History.yourAnswer + ":"
        setupOptionLabel(with: answer)
        resultLabel.text = answer.option.isRight ? String.History.correct : String.History.incorrect
        resultImageView.image = answer.option.isRight ? UIImage(named: "CorrectMark") : UIImage(named: "IncorrectMark")
        responseTimeLabel.text = String.History.responseTime + ": " + answer.responseTime.round(2).description
    }
    
    private func setupOptionLabel(with answer: PartTwoAnswer) {
        stringOptionLabel.text = answer.option.value
        stringOptionLabel.backgroundColor = answer.option.isRight ? UIColor.NAGreen : UIColor.NARed
        stringOptionLabel.layer.masksToBounds = true
        stringOptionLabel.layer.cornerRadius = 25
    }
}
