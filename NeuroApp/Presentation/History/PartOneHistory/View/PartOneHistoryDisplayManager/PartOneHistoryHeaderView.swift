//
//  PartOneHistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.12.2021.
//

import UIKit

class PartOneHistoryHeaderView: UIView {
    private let baseHeaderView = AverageHistoryHeaderView()
    
    private let baseInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = String.PartOneQuiz.taskText
        return label
    }()
    
    private let scaleDescriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let scaleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    private let arrowView: DoubleSidedArrowView = {
        let view = DoubleSidedArrowView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
        layout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupInitialState() {
        setupScaleDescriptionStackView()
        setupScaleStackView()
    }
    
    private func setupScaleDescriptionStackView() {
        let leftScaleDescriptionLabel = UILabel()
        leftScaleDescriptionLabel.textAlignment = .center
        leftScaleDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
        leftScaleDescriptionLabel.numberOfLines = 0
        leftScaleDescriptionLabel.text = String.PartOneQuiz.leftScaleDescription
        
        let centerScaleDescriptionLabel = UILabel()
        centerScaleDescriptionLabel.textAlignment = .center
        centerScaleDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
        centerScaleDescriptionLabel.numberOfLines = 0
        centerScaleDescriptionLabel.text = String.PartOneQuiz.centerScaleDescription
        
        let rightScaleDescriptionLabel = UILabel()
        rightScaleDescriptionLabel.textAlignment = .center
        rightScaleDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
        rightScaleDescriptionLabel.numberOfLines = 0
        rightScaleDescriptionLabel.text = String.PartOneQuiz.rightScaleDescription
        
        scaleDescriptionStackView.addArrangedSubview(leftScaleDescriptionLabel)
        scaleDescriptionStackView.addArrangedSubview(centerScaleDescriptionLabel)
        scaleDescriptionStackView.addArrangedSubview(rightScaleDescriptionLabel)
    }
    
    private func setupScaleStackView() {
        for index in 0...10 {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 17)
            label.text = index.description
            scaleStackView.addArrangedSubview(label)
        }
    }

    func setup(with result: Result) {
        baseHeaderView.update(with: result, scoreLabelTitle: String.Score.partOneDescription)
    }
    
    private func layout() {
        addSubview(baseHeaderView)
        addSubview(baseInfoLabel)
        addSubview(scaleDescriptionStackView)
        addSubview(scaleStackView)
        addSubview(arrowView)
        
        baseHeaderView.translatesAutoresizingMaskIntoConstraints = false
        baseInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        scaleDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        scaleStackView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseHeaderView.topAnchor.constraint(equalTo: topAnchor),
            baseHeaderView.leftAnchor.constraint(equalTo: leftAnchor),
            baseHeaderView.rightAnchor.constraint(equalTo: rightAnchor),
            baseHeaderView.bottomAnchor.constraint(equalTo: baseInfoLabel.topAnchor),
            
            baseInfoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            baseInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            baseInfoLabel.bottomAnchor.constraint(equalTo: scaleDescriptionStackView.topAnchor, constant: -20),
            
            scaleDescriptionStackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 20),
            scaleDescriptionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scaleDescriptionStackView.bottomAnchor.constraint(equalTo: scaleStackView.topAnchor, constant: -20),
            
            scaleStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            scaleStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scaleStackView.bottomAnchor.constraint(equalTo: arrowView.topAnchor),
            
            arrowView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            arrowView.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowView.heightAnchor.constraint(equalToConstant: 20),
            arrowView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
