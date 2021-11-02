//
//  OptionStringView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 02.11.2021.
//

import UIKit

class OptionStringView: UIView {
    var option: Option? {
        didSet {
            guard let option = option as? StringOption else {
                return
            }
            label.text = option.value
        }
    }
    private var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        return label
    }()
    var state: State = .notSelected {
        didSet {
            switch state {
            case .selected:
                turnSelectedState()
            case .notSelected:
                turnNotSelectedState()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func layout() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)])
    }
    
    func turnSelectedState() {
        label.textColor = .white
        self.backgroundColor = .NAGreen
    }
    
    func turnNotSelectedState() {
        label.textColor = .black
        self.backgroundColor = .NAGray
    }
    
    enum State {
        case selected
        case notSelected
    }
}
