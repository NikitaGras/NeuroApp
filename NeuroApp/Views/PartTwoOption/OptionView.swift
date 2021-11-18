//
//  OptionView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import UIKit

class OptionView: UIView, OptionViewDelegate {
    private let imageContainerView = OptionImageContainerView()
    private let stringContainerView = OptionStringContainerView()

    weak var delegate: OptionViewDelegate?
    
    lazy var heightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }
    
    private func setupInitialState() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.frame.origin = CGPoint.zero
        imageContainerView.frame.size = frame.size
        imageContainerView.delegate = self
        
        stringContainerView.translatesAutoresizingMaskIntoConstraints = false
        stringContainerView.frame.origin = CGPoint.zero
        stringContainerView.frame.size = frame.size
        stringContainerView.delegate = self
        
        heightConstraint.isActive = true
    }
    
    func show(options: [Option]) {
        subviews.forEach { $0.removeFromSuperview() }
        
        if let options = options as? [ImageOption] {
            imageContainerView.setup(with: options)
            heightConstraint.constant = imageContainerView.frame.height
            addSubview(imageContainerView)
        }
        
        if let options = options as? [StringOption] {
            stringContainerView.setup(with: options)
            heightConstraint.constant = stringContainerView.frame.height
            addSubview(stringContainerView)
        }
    }

    func optionView(_ view: UIView, selectedOption: Option) {
        delegate?.optionView(self, selectedOption: selectedOption)
    }
}
