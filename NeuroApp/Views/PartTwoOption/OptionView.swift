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

//class OptionImageContainerView: UIStackView {
//
//    struct Appearance {
//        static var spacing: CGFloat = 10
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//
//    private func setup() {
//        axis = .vertical
//        distribution = .fillEqually
//        alignment = .fill
//        spacing = Appearance.spacing
//        layout()
//    }
//
//    private func layout() {
//        let stackView1 = UIStackView()
//        stackView1.axis = .horizontal
//        stackView1.distribution = .fillEqually
//        stackView1.alignment = .fill
//        stackView1.spacing = Appearance.spacing
//
//        let stackView2 = UIStackView()
//        stackView2.axis = .horizontal
//        stackView2.distribution = .fillEqually
//        stackView2.alignment = .fill
//        stackView2.spacing = Appearance.spacing
//
//        addArrangedSubview(stackView1)
//        addArrangedSubview(stackView2)
//
//        let image = UIImage(named: "dog")
//
//        let imageView = UIImageView(image: image)
//        stackView1.addArrangedSubview(imageView)
//        let imageView2 = UIImageView(image: image)
//        stackView1.addArrangedSubview(imageView2)
//
//        let imageView3 = UIImageView(image: image)
//        stackView2.addArrangedSubview(imageView3)
//        let imageView4 = UIImageView(image: image)
//        stackView2.addArrangedSubview(imageView4)
//
//        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
//    }

//    }
