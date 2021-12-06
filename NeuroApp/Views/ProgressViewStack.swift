//
//  ProgressViewStack.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06.12.2021.
//

import UIKit

class ProgressViewStack: UIStackView {
    var progressViewArr: [UIProgressView] = []
    var currentProgressView: UIProgressView?
    var oneStepValue: Float = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    private func setupInitialState() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 10
        for index in 0...2 {
            let progressView = UIProgressView()
            progressView.tag = index
            progressView.progressTintColor = UIColor.NABlue
            progressViewArr.append(progressView)
            self.addArrangedSubview(progressView)
        }
    }
    
    func setup(with quiz: Quiz) {
        if quiz.state == .partOneProceed {
            currentProgressView = progressViewArr[0]
            setupCurrentProgressView(questionNumber: quiz.partOneQuestions.count,
                                     answerNumber: quiz.partOneAnswers.count)
            progressViewArr[1].progress = 0
            progressViewArr[2].progress = 0
        }
        if quiz.state == .partTwoProceed {
            progressViewArr[0].progress = 1
            currentProgressView = progressViewArr[1]
            setupCurrentProgressView(questionNumber: quiz.partTwoQuestions.count,
                                     answerNumber: quiz.partTwoAnswers.count)
            progressViewArr[2].progress = 0
        }
        if quiz.state == .partThreeProceed {
            progressViewArr[0].progress = 1
            progressViewArr[1].progress = 1
            currentProgressView = progressViewArr[2]
            let answerNumber = quiz.partThreeAnswer == nil ? 0 : 1
            setupCurrentProgressView(questionNumber: 1, answerNumber: answerNumber)
        }
    }
    
    private func setupCurrentProgressView(questionNumber: Int, answerNumber: Int) {
        oneStepValue = 1.0 / Float(questionNumber)
        let currentProgress: Float = Float(answerNumber) * oneStepValue
        currentProgressView?.progress = currentProgress
    }
    
    func fill() {
        currentProgressView?.progress += oneStepValue
    }
}
