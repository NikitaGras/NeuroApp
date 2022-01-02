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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func layout() {
        self.addSubview(dateLabel)
        self.addSubview(scoreView)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: scoreView.topAnchor, constant: -20),

            scoreView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            scoreView.heightAnchor.constraint(equalToConstant: 200),
            scoreView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            NSLayoutConstraint(item: scoreView, attribute: .width, relatedBy: .equal,
                               toItem: self, attribute: .width, multiplier: 0.3, constant: 0),
            NSLayoutConstraint(item: scoreView, attribute: .height, relatedBy: .equal,
                               toItem: scoreView, attribute: .width, multiplier: 1, constant: 0)
        ])
    }
    
    func setup(with result: Result) {
        let dateString = DateFormatter.fulldate.string(from: result.finishTime)
        dateLabel.text = dateString
        
        let title = String.Score.averageScore
        let score = result.avarageScore.description
        scoreView.setup(title, score)
    }
}
