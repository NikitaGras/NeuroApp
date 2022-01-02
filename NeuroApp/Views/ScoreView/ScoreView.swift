//
//  ScoreView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 18.11.2021.
//

import UIKit

class ScoreView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
        setupInitialState()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scoreView.layer.cornerRadius = self.frame.width / 2
    }
    
    private func setupInitialState() {
        scoreView.layer.borderWidth = 5
        scoreView.layer.borderColor = UIColor.NABlue.cgColor
    }

    func setup(_ title: String, _ score: String) {
        titleLabel.text = title
        scoreLabel.text = score
    }
}
