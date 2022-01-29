//
//  AverageHistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.12.2021.
//

import UIKit

class AverageHistoryHeaderView: UIView {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let averageScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let scoreView: ScoreView = {
        let view = ScoreView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func layout() {
        self.addSubview(dateLabel)
        self.addSubview(averageScoreLabel)
        self.addSubview(scoreView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            dateLabel.bottomAnchor.constraint(equalTo: averageScoreLabel.topAnchor, constant: -10),
//            dateLabel.heightAnchor.constraint(equalToConstant: 20),

            averageScoreLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            averageScoreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            averageScoreLabel.bottomAnchor.constraint(equalTo: scoreView.topAnchor, constant: -5),
//            averageScoreLabel.heightAnchor.constraint(equalToConstant: 20),
            
            scoreView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            NSLayoutConstraint(item: scoreView, attribute: .width, relatedBy: .equal,
                               toItem: self, attribute: .width, multiplier: 0.3, constant: 0),
            NSLayoutConstraint(item: scoreView, attribute: .height, relatedBy: .equal,
                               toItem: scoreView, attribute: .width, multiplier: 1, constant: 0),
            scoreView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    func update(with result: Session, scoreLabelTitle title: String) {
        let dateString = DateFormatter.fulldate.string(from: result.finishTime)
        dateLabel.text = dateString
        
        averageScoreLabel.text = title
        
        scoreView.setup(with: result.avarageScore)
    }
}
