//
//  OptionStringContainerView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 08.11.2021.
//

import UIKit

class OptionStringContainerView: UIView, OptionViewDelegate {
    var delegate: OptionViewDelegate?
    
    //MARK: Appearance
    let margin: CGFloat = 10
    let maxColumnNumber: Int = 2
    var optionWidth: CGFloat {
        return (frame.width - margin) / 2
    }
    var optionHeight: CGFloat {
        return optionWidth / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func setup(with options: [StringOption]) {
        subviews.forEach { $0.removeFromSuperview() }
        options.forEach { option in
            let optionStringView = OptionStringView()
            optionStringView.option = option
            optionStringView.delegate = self
            addSubview(optionStringView)
        }
        layout()
    }
    
    private func layout() {
        subviews.enumerated().forEach { index, view in
            view.frame.origin = CGPoint.getOrigin(for: index, with: maxColumnNumber, width: optionWidth, height: optionHeight, margin: margin)
            view.frame.size = CGSize(width: optionWidth, height: optionHeight)
        }
        frame.size.height = optionHeight * 2 + margin
    }
    
    func optionView(_ view: UIView, selectedOption: Option) {
        subviews.forEach { view in
            let imageView = view as? OptionImageView
            if imageView?.option?.value != selectedOption.value {
                imageView?.state = .notSelected
            }
        }
        delegate?.optionView(self, selectedOption: selectedOption)
    }
}
