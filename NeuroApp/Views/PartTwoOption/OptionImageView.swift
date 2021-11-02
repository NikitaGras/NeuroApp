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
                turnNotSelectedState()
            case .selected:
                turnSelectedState()
            }
        }
    }
    
    private func turnSelectedState() {
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 5
        self.layer.opacity = 0.7
    }
    
    private func turnNotSelectedState() {
        self.layer.borderWidth = 0
        self.layer.opacity = 1
    }
    
    enum State {
        case none
        case selected
        case notSelected
    }
}
