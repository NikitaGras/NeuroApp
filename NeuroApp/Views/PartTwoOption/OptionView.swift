//
//  OptionView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import UIKit

class OptionView: UIView {
    private var optionStringViews = [OptionStringView]()
    private var optionImageViews = [OptionImageView]()
    
    private var imageContainerView = UIView()
    private var stringContainerView = UIView()
    
    var delegate: OptionViewDelegate?
    
    private let margin: CGFloat = 10
    private var optionWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageContainerView.isHidden ? layoutStringContainer() : layoutImageContainer()
    }
    
    private func setupInitialState() {
        optionWidth = (self.frame.width - margin) / 2
        setupImageContainer()
        setupStringContainer()
    }
    
    private func setupImageContainer() {
        for _ in 0...3 {
            let option = OptionImageView()
            option.contentMode = .scaleAspectFit
            option.isUserInteractionEnabled = true

            optionImageViews.append(option)
            imageContainerView.addSubview(option)

            let gesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
            option.addGestureRecognizer(gesture)
        }
        self.addSubview(imageContainerView)
    }
    
    private func setupStringContainer() {
        for _ in 0...3 {
            let option = OptionStringView()
            option.isUserInteractionEnabled = true

            optionStringViews.append(option)
            stringContainerView.addSubview(option)

            let gesture = UITapGestureRecognizer(target: self, action: #selector(touch(_:)))
            option.addGestureRecognizer(gesture)
        }
        self.addSubview(stringContainerView)
    }
    
    private func layoutImageContainer() {
        imageContainerView.frame.origin = .zero
        imageContainerView.frame.size = .init(width: self.frame.width, height: self.frame.width)
        
        optionImageViews.forEach { optionImageView in
            optionImageView.frame.size = .init(width: optionWidth, height: optionWidth)
        }
        optionImageViews[0].frame.origin = .zero
        optionImageViews[1].frame.origin = .init(x: 0, y: optionWidth + margin)
        optionImageViews[2].frame.origin = .init(x: optionWidth + margin, y: 0)
        optionImageViews[3].frame.origin = .init(x: optionWidth + margin, y: optionWidth + margin)
        
        self.frame.size = .init(width: self.frame.width, height: self.frame.width)
    }
    
    private func layoutStringContainer() {
        stringContainerView.frame.origin = .zero
        stringContainerView.frame.size = .init(width: self.frame.width, height: self.frame.width / 2)
        
        let optionHeight = stringContainerView.frame.height / 2 - margin
        
        optionStringViews.forEach { optionStringView in
            optionStringView.frame.size = .init(width: optionWidth, height: optionHeight)
        }
        optionStringViews[0].frame.origin = .zero
        optionStringViews[1].frame.origin = .init(x: 0, y: optionHeight + margin)
        optionStringViews[2].frame.origin = .init(x: optionWidth, y: 0)
        optionStringViews[3].frame.origin = .init(x: optionWidth, y: optionHeight)
        
        self.frame.size = .init(width: self.frame.width, height: stringContainerView.frame.height)
    }
    
    func show(options: [Option]) {
        if (options.first as? ImageOption) != nil {
            for index in 0...3 {
                optionImageViews[index].option = options[index]
                imageContainerView.isHidden = false
                stringContainerView.isHidden = true
            }
            layoutImageContainer()
        }
        if (options.first as? StringOption) != nil {
            for index in 0...3 {
                optionStringViews[index].option = options[index]
                imageContainerView.isHidden = true
                stringContainerView.isHidden = false
            }
            layoutStringContainer()
        }
    }
    
    @objc func tap(_ optionImageView: OptionImageView) {
        guard let option = optionImageView.option else {
            return
        }
        for view in optionImageViews {
            view.state = view.option?.value == option.value ? .selected : .notSelected
        }
        delegate?.optionView(self, selectedOption: option)
    }
    
    @objc func touch(_ optionStringView: OptionStringView) {
        guard let option = optionStringView.option else {
            return
        }
        for view in optionStringViews {
            view.state = view.option?.value == option.value ? .selected : .notSelected
        }
        delegate?.optionView(self, selectedOption: option)
    }
}
