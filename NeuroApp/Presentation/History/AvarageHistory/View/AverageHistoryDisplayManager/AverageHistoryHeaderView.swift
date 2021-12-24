//
//  AverageHistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.12.2021.
//

import UIKit

class AverageHistoryHeaderView: UIView {
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    let scoreView: ScoreView = {
        let view = ScoreView()
        return view
    }()
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("dd MMMM YYYY")
        return df
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func layout() {
        self.addSubview(dateLabel)
        self.addSubview(scoreView)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: scoreView.topAnchor, constant: -20)
        ])
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scoreView.heightAnchor.constraint(equalToConstant: 200),
            scoreView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            NSLayoutConstraint(item: scoreView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.4, constant: 0)
        ])
    }
    
    func setup(with result: Result) {
        let dateString = dateFormatter.string(from: result.finishTime)
        dateLabel.text = dateString
        
        scoreView.titleLabel.text = String.Score.averageScore
        scoreView.scoreLabel.text = result.avarageScore.description
    }
}
