//
//  PartThreeTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10.01.2022.
//

import UIKit

class PartThreeHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var answerTextLabel: UILabel!
    
    func fill(with answer: PartThreeAnswer) {
        questionLabel.text = answer.question
        yourAnswerLabel.text = String.History.yourAnswer
        answerTextLabel.text = answer.userText
    }
}
