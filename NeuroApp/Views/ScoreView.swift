//
//  ScoreView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.01.2022.
//

import UIKit

class ScoreView: UIView {
    private let scoreView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.NABlue.cgColor
        view.layer.borderWidth = 4
        return view
    }()
    
    private var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
    }
    
    private func layout() {
        addSubview(scoreView)
        scoreView.addSubview(scoreLabel)
        
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: scoreView, attribute: .width, relatedBy: .equal, toItem: scoreView, attribute: .height, multiplier: 1, constant: 0),
            scoreView.leftAnchor.constraint(equalTo: leftAnchor),
            scoreView.rightAnchor.constraint(equalTo: rightAnchor),
            scoreView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scoreLabel.leftAnchor.constraint(equalTo: scoreView.leftAnchor, constant: 5),
            scoreLabel.rightAnchor.constraint(equalTo: scoreView.rightAnchor, constant: -5),
            scoreLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
        ])
    }
    
    func setup(with score: Int) {
        scoreLabel.text = score.description
    }
}
