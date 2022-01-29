//
//  ScoreScreenScoreScreenViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController, ScoreScreenViewInput {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var averageScoreView: ScoreView!
    @IBOutlet var scoreLabels: [UILabel]!
    @IBOutlet var scoreViews: [ScoreView]!
    @IBOutlet weak var nextButton: RoundButton!
    
    var output: ScoreScreenViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ScoreScreenViewInput
    func setupInitialState() {
        averageScoreLabel.text = String.Score.avarage
        scoreLabels.forEach { scoreLabel in
            if scoreLabel.tag == 0 {
                scoreLabel.text = String.Score.partOne
            }
            if scoreLabel.tag == 1 {
                scoreLabel.text = String.Score.partTwo
            }
            if scoreLabel.tag == 2 {
                scoreLabel.text = String.Score.partThree
            }
        }
        nextButton.setTitle(String.Button.goHome, for: .normal)
        titleTextLabel.text = String.Score.mainText
    }
    
    func setup(with result: Session) {
        averageScoreView.setup(with: result.avarageScore)
        scoreViews.forEach { scoreView in
            if scoreView.tag == 0 {
                scoreView.setup(with: result.partOneScore)
            }
            if scoreView.tag == 1 {
                scoreView.setup(with: result.partTwoScore)
            }
            if scoreView.tag == 2 {
                scoreView.setup(with: result.partThreeScore)
            }
        }
    }
    
    @IBAction func next(_ sender: Any) {
        output.goHome()
    }
}
