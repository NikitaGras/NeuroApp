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
    
    //TODO: нужно переместить, чтобы не создавался в каждой ячейке?
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("MMM d")
        return df
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scoreTitleLabel.text = "\(String.Score.score):"
    }
    
    func fill(with result: Result) {
        let dateString = dateFormatter.string(from: result.finishTime)
        dateLabel.text = dateString
        scoreValueLabel.text = result.avarageScore.description
    }
}
