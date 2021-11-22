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
        layout()
    }
    
    private func setupInitialState() {
        scoreView.layer.borderWidth = 5
        scoreView.layer.borderColor = UIColor.NABlue.cgColor
        layout()
    }
    
    private func layout() {
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
    }
}
