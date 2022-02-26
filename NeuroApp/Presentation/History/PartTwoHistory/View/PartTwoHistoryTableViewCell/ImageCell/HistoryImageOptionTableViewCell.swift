//
//  HistoryImageOptionTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 21.02.2022.
//

import UIKit

class HistoryImageOptionTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var imageOptionView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var responseTimeLabel: UILabel!
    
    func fill(with answer: PartTwoAnswer) {
        questionLabel.text = answer.questionText
        yourAnswerLabel.text = String.History.yourAnswer + ":"
        setup(with: answer.option)
        responseTimeLabel.text = String.History.responseTime + ": " + answer.responseTime.round(2).description
    }
    
    private func setup(with option: Option) {
        guard let option = option as? ImageOption else {
            imageOptionView.image = UIImage(named: "Error")
            return
        }
        imageOptionView.image = option.asImage()
        imageOptionView.layer.borderWidth = 5
        imageOptionView.layer.borderColor = option.isRight ? UIColor.NAGreen.cgColor : UIColor.NARed.cgColor
        
        resultLabel.text = option.isRight ? String.correct : String.incorrect
        
        resultImageView.image = option.isRight ? UIImage(named: "CorrectMark") : UIImage(named: "IncorrectMark")
    }
}
