//
//  HistoryMainTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import UIKit

class HistoryMainTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("MMM d")
        return df
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        scoreTitleLabel.text = String.Score.score
        container.layer.cornerRadius = 15
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.NAGray.cgColor
    }
    
    func fill(with result: Session) {
        let dateString = dateFormatter.string(from: result.finishTime)
        dateLabel.text = dateString
        scoreValueLabel.text = result.avarageScore.description
    }
}
