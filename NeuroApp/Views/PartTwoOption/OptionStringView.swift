//
//  OptionStringView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 02.11.2021.
//

import UIKit

class OptionStringView: UILabel {
    var option: StringOption? {
        didSet {
            text = option?.value
        }
    }
    var state: State = .notSelected {
        didSet {
            state == .notSelected ? switchNotSelectedState() : switchSelectedState()
        }
    }
    
    var delegate: OptionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }
    
    private func setupInitialState() {
        font = .systemFont(ofSize: 25)
        textColor = UIColor.black
        backgroundColor = UIColor.NAGray
        textAlignment = .center
        numberOfLines = 1
        minimumScaleFactor = 0.5
        isUserInteractionEnabled = true
        
        layer.masksToBounds = true
        layer.cornerRadius = 20
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(gesture)
    }
    
    @objc private func tap() {
        if let option = option {
            self.state = .selected
            delegate?.optionView(self, selectedOption: option)
        }
    }
    
    private func switchSelectedState() {
        textColor = .white
        backgroundColor = .NAGreen
    }
    
    private func switchNotSelectedState() {
        textColor = .black
        backgroundColor = .NAGray
    }
    
    enum State {
        case selected
        case notSelected
    }
}
