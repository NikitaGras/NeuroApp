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
    }
    
    func setup(progressViewsNumber: Int, currentProgressViewIndex: Int,
               questionsNumber: Int, currentQuestionIndex:Int) {
        subviews.forEach { view in
            view.removeFromSuperview()
        }
        createProgressView(progressViewsNumber: progressViewsNumber)
        
        currentProgressView = progressViewArr[currentProgressViewIndex]
        setupCurrentProgressView(questionsNumber: questionsNumber, answersNumber: currentQuestionIndex)
        
        setupProgressViews()
    }
    
    private func createProgressView(progressViewsNumber number: Int) {
        for index in 0..<number {
            let progressView = UIProgressView()
            progressView.tag = index
            progressView.progressTintColor = UIColor.NABlue
            progressViewArr.append(progressView)
            self.addArrangedSubview(progressView)
        }
    }

    private func setupProgressViews() {
        progressViewArr.forEach { progressView in
            let tag = progressView.tag
            if tag < currentProgressView?.tag ?? 0 {
                progressView.progress = 1.0
            }
            if tag > currentProgressView?.tag ?? 0 {
                progressView.progress = 0.0
            }
        }
    }
    
    private func setupCurrentProgressView(questionsNumber: Int, answersNumber: Int) {
        oneStepValue = 1.0 / Float(questionsNumber)
        let currentProgress: Float = Float(answersNumber) * oneStepValue
        currentProgressView?.progress = currentProgress
    }
    
    func fill() {
        currentProgressView?.progress += oneStepValue
    }
}
