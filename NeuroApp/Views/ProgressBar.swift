//
//  ProgressBar.swift
//  NeuroApp
//
//  Created by Nikita Gras on 03.12.2021.
//

import UIKit

class ProgressBar: UIStackView {
    private var labels: [UILabel] = []
    private var currentIndex: Int = 0
    private var valueForLabel: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStackView()
    }
    
    func addArrangedViews(numberOfViews: Int, currentIndex: Int = 0, startFrom value: Int = 0) {
        self.currentIndex = currentIndex
        self.valueForLabel = value
        
        for _ in 0 ..< numberOfViews {
            let label = createLabel()
            labels.append(label)
            self.addArrangedSubview(label)
        }
        setup(labels: labels)
    }
    
    func goForward() {
        if currentIndex < labels.count {
            setCompleteState(for: labels[currentIndex])
            currentIndex += 1
        }
        setup(labels: labels)
    }
    
    private func setupStackView() {
        self.axis = .horizontal
        self.distribution = .equalSpacing
        self.alignment = .center
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        valueForLabel += 1
        label.text = valueForLabel.description
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        setInitialState(for: label)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)])
        return label
    }
    
    private func setup(labels: [UILabel]) {
        if currentIndex < labels.count {
            for index in 0..<currentIndex {
                setCompleteState(for: labels[index])
            }
            setCurrentState(for: labels[currentIndex])
        }
    }
    
    private func setInitialState(for label: UILabel) {
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = UIColor.clear
    }
    
    private func setCompleteState(for label: UILabel) {
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = UIColor.green
    }
    
    private func setCurrentState(for label: UILabel) {
        label.layer.borderColor = UIColor.blue.cgColor
        label.backgroundColor = UIColor.clear
    }
}
