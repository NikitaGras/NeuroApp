//
//  ScoreScreenScoreScreenViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController, ScoreScreenViewInput {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var averageScoreView: ScoreView!
    @IBOutlet var scoreViews: [ScoreView]!
    
    var output: ScoreScreenViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ScoreScreenViewInput
    func setupInitialState() {
        averageScoreView.titleLabel.text = String.Score.avarage
        scoreViews.forEach { scoreView in
            if scoreView.tag == 0 {
                scoreView.titleLabel.text = String.Score.partOne
            }
            if scoreView.tag == 1 {
                scoreView.titleLabel.text = String.Score.partTwo
            }
            if scoreView.tag == 2 {
                scoreView.titleLabel.text = String.Score.partThree
            }
        }
    }
    
    func setup(with result: Result) {
        averageScoreView.scoreLabel.text = result.avarageScore.description
        scoreViews.forEach { scoreView in
            if scoreView.tag == 0 {
                scoreView.scoreLabel.text = result.partOneScore.description
            }
            if scoreView.tag == 1 {
                scoreView.scoreLabel.text = result.partTwoScore.description
            }
            if scoreView.tag == 2 {
                scoreView.scoreLabel.text = result.partThreeScore.description
            }
        }
    }
    
    @IBAction func goHome(sender: Any) {
        output.goHome()
    }
}
