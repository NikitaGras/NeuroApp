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
        yourAnswerLabel.text = String.History.yourAnswer
        
        let option = answer.option as! ImageOption
        imageOptionView.image = option.asImage()
        
        resultLabel.text = answer.option.isRight ? String.correct : String.incorrect
        responseTimeLabel.text = answer.responseTime.description
    }
}
