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
    
    @IBOutlet weak var optionViewHeightConstraint: NSLayoutConstraint!
    
//    private lazy var heightConstraint = NSLayoutConstraint(item: optionView, attribute: .height, relatedBy: .equal, toItem: optionView, attribute: .width, multiplier: 1, constant: 0)
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        heightConstraint.isActive = true
//    }
    
    func fill(with answer: PartTwoAnswer) {
        questionLabel.text = answer.questionText
        answerLabel.text = String.History.yourAnswer + ":"
        setupOptionView(with: answer.option)
        correctMarkLabel.text = answer.option.isRight ? String.History.correct : .History.incorrect
        correctMarkImageView.image = answer.option.isRight ? UIImage(named: "CorrectMark") : UIImage(named: "IncorrectMark")
        responseTimeLabel.text = "\(String.History.responseTime): \(answer.responseTime.description)s"
    }
    
    private func setupOptionView(with option: Option) {
        optionView.subviews.forEach {$0.removeFromSuperview()}
        
        if let option = option as? ImageOption {
            let view = OptionImageView(frame: optionView.bounds)
            view.option = option
            optionView.addSubview(view)
            optionViewHeightConstraint.constant = optionView.frame.width
        }
        
        if let option = option as? StringOption {
            let view = OptionStringView(frame: optionView.bounds)
            view.option = option
            optionView.addSubview(view)
            optionViewHeightConstraint.constant = optionView.frame.width / 2
        }
    }
}
