//
//  PartTwoHistoryTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04.01.2022.
//

import UIKit

class PartTwoHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var optionView: UIView!
    @IBOutlet weak var correctMarkLabel: UILabel!
    @IBOutlet weak var correctMarkImageView: UIImageView!
    @IBOutlet weak var responseTimeLabel: UILabel!
    
    private lazy var heightConstraint = NSLayoutConstraint(item: optionView, attribute: .height, relatedBy: .equal, toItem: optionView, attribute: .width, multiplier: 1, constant: 0)
    
    func fill(with answer: PartTwoAnswer) {
        questionLabel.text = answer.questionText
        answerLabel.text = String.History.yourAnswer + ":"
        setupOptionView(with: answer.option)
        correctMarkLabel.text = answer.option.isRight ? String.History.correct : .History.incorrect
        correctMarkImageView.image = answer.option.isRight ? UIImage.init(named: "CorrectMark") : UIImage(named: "IncorrectMark")
        responseTimeLabel.text = "\(String.History.responseTime): \(answer.responseTime.description)s"
    }
    
    private func setupOptionView(with option: Option) {
        optionView.subviews.forEach {$0.removeFromSuperview()}
        
        if let option = option as? ImageOption {
            
        } else if let option = option as? StringOption {
            
        }
    }
}
