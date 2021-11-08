//
//  OptionImageView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import UIKit

class OptionImageView: UIImageView {
    var option: Option? {
        didSet {
            guard let option = option as? ImageOption else {
                return
            }
            self.image = option.asImage()
        }
    }
    
    var state: State = .none {
        didSet {
            switch state {
            case .none:
                return
            case .notSelected:
                switchNotSelectedState()
            case .selected:
                switchSelectedState()
            }
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
        isUserInteractionEnabled = true
        contentMode = .scaleAspectFit
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
        self.layer.borderColor = UIColor.NAGreen.cgColor
        self.layer.borderWidth = 10
    }
    
    private func switchNotSelectedState() {
        // TODO: затемнить View
        self.layer.borderWidth = 0
    }
    
    enum State {
        case none
        case selected
        case notSelected
    }
}
