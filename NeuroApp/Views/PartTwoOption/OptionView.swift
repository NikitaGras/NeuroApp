//
//  OptionView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import UIKit

class OptionView: UIView, OptionViewDelegate {
    private var optionStringViews = [OptionStringView]()
    private var optionImageViews = [OptionImageView]()
    
    private var imageContainerView = UIView()
    private var stringContainerView = UIView()
    
    weak var delegate: OptionViewDelegate?
    
    // MARK: Appearance
    private let margin: CGFloat = 10
    private var optionWidth: CGFloat = 0
    private var optionHeight: CGFloat = 0
    private var maxColumn: Int = 2
    
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
        setupImageContainer()
        setupStringContainer()
    }
    
    private func setupImageContainer() {
        for _ in 0...3 {
            let optionImageView = OptionImageView(frame: CGRect.init())
            optionImageView.delegate = self
            optionImageViews.append(optionImageView)
            imageContainerView.addSubview(optionImageView)
        }
        addSubview(imageContainerView)
    }
    
    private func setupStringContainer() {
        for _ in 0...3 {
            let optionStringView = OptionStringView()
            optionStringView.delegate = self
            optionStringViews.append(optionStringView)
            stringContainerView.addSubview(optionStringView)
        }
        addSubview(stringContainerView)
    }
    
    private func layoutImageContainer() {
        optionWidth = (self.frame.width - margin) / 2
        optionHeight = optionWidth
        
        imageContainerView.frame.origin = .zero
        imageContainerView.frame.size = .init(width: self.frame.width, height: self.frame.width)
        
        optionImageViews.enumerated().forEach { index,optionImageView in
            optionImageView.frame.size = .init(width: optionWidth, height: optionWidth)
            optionImageView.frame.origin = getPoint(from: index)
        }
        self.frame.size = .init(width: self.frame.width, height: self.frame.width)
    }
    
    private func layoutStringContainer() {
        optionWidth = (self.frame.width - margin) / 2
        optionHeight = optionWidth / 2
        
        stringContainerView.frame.origin = .zero
        stringContainerView.frame.size = .init(width: self.frame.width, height: optionHeight * 2 + margin)
        
        optionStringViews.enumerated().forEach { index,optionStringView in
            optionStringView.frame.size = .init(width: optionWidth, height: optionHeight)
            optionStringView.frame.origin = getPoint(from: index)
        }
        self.frame.size = .init(width: self.frame.width,
                                height: optionHeight * 2 + margin)
    }
    
    private func getPoint(from index: Int) -> CGPoint {
        let index = index + 1
        let col = CGFloat((maxColumn - index % maxColumn) - 1)
        let row = CGFloat((index % maxColumn + index / maxColumn) - 1)
        return CGPoint(x: (optionWidth + margin) * col, y: (optionHeight + margin) * row)
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
    
    func optionView(_ view: UIView, selectedOption: Option) {
        optionImageViews.forEach { optionView in
            if optionView.option?.value != selectedOption.value {
                optionView.state = .notSelected
            }
        }
        optionStringViews.forEach { optionView in
            if optionView.option?.value != selectedOption.value {
                optionView.state = .notSelected
            }
        }
        delegate?.optionView(self, selectedOption: selectedOption)
    }
}
