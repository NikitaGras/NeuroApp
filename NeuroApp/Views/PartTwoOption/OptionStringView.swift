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
    
    var delegate: OptionViewDelegate?
    
    var state: State = .notSelected {
        didSet {
            switch state {
            case .selected:
                switchSelectedState()
            case .notSelected:
                switchNotSelectedState()
            }
        }
    }
    
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
        layout()
    }
    
    private func setupInitialState() {
        self.addSubview(label)
        label.isUserInteractionEnabled = true
        switchNotSelectedState()
        layer.cornerRadius = 20
//        layer.masksToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        label.addGestureRecognizer(gesture)
    }
    
    private func layout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)])
    }
    
    @objc private func tap() {
        if let option = option {
            self.state = .selected
            delegate?.optionView(self, selectedOption: option)
        }
    }
    
    private func switchSelectedState() {
        label.textColor = .white
        self.backgroundColor = .NAGreen
    }
    
    private func switchNotSelectedState() {
        label.textColor = .black
        self.backgroundColor = .NAGray
    }
    
    enum State {
        case selected
        case notSelected
    }
}
