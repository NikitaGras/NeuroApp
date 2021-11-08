//
//  OptionView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import UIKit

class OptionView: UIView, OptionViewDelegate {
    var delegate: OptionViewDelegate?
    
    
    
    func optionView(_ view: UIView, selectedOption: Option) {
        delegate?.optionView(self, selectedOption: selectedOption)
    }
}

//class OptionView: UIView, OptionViewDelegate {
//    private let imageContainerView = OptionImageContainerView()
//    private let stringContainerView = OptionStringContainerView()
//
//    weak var delegate: OptionViewDelegate?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupInitialState()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupInitialState()
//    }
//
////    override var intrinsicContentSize: CGSize {
////        return imageContainerView.isHidden ? stringContainerView.frame.size : imageContainerView.frame.size
////    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        let isImageContainer = imageContainerView.superview != nil
////
////        if isImageContainer {
////            imageContainerView.frame.size.width = frame.width
////        } else {
////            stringContainerView.frame.size.width = frame.width
////        }
//
////        stringContainerView.frame.size.width = frame.width
////        imageContainerView.frame.size.width = frame.width
////        imageContainerView.isHidden ? layoutStringContainer() : layoutImageContainer()
//    }
//
//    private func setupInitialState() {
////        addSubview(imageContainerView)
////        addSubview(stringContainerView)
//    }
//
////    private func layoutImageContainer() {
////        imageContainerView.frame.origin = .zero
////        imageContainerView.frame.size = self.frame.size
////    }
////
////    private func layoutStringContainer() {
////        stringContainerView.frame.origin = .zero
////        stringContainerView.frame.size = self.frame.size
////    }
//
//    func show(options: [Option]) {
//        if let options = options as? [ImageOption] {
//            stringContainerView.removeFromSuperview()
//            addSubview(imageContainerView)
//            imageContainerView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                imageContainerView.leftAnchor.constraint(equalTo: leftAnchor),
//                imageContainerView.rightAnchor.constraint(equalTo: rightAnchor),
//                imageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
//                imageContainerView.topAnchor.constraint(equalTo: topAnchor),
//            ])
////            imageContainerView.isHidden = false
////            stringContainerView.isHidden = true
////            imageContainerView.setup(with: options)
////            frame.size.height = imageContainerView.frame.size.height
//        }
//        if let options = options as? [StringOption] {
//            imageContainerView.removeFromSuperview()
//            addSubview(stringContainerView)
//            stringContainerView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                stringContainerView.leftAnchor.constraint(equalTo: leftAnchor),
//                stringContainerView.rightAnchor.constraint(equalTo: rightAnchor),
//                stringContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
//                stringContainerView.topAnchor.constraint(equalTo: topAnchor),
//            ])
////            imageContainerView.isHidden = true
////            stringContainerView.isHidden = false
//            stringContainerView.setup(with: options)
////            frame.size.height = stringContainerView.frame.size.height
//        }
//        layoutSubviews()
//    }
//
//    func optionView(_ view: UIView, selectedOption: Option) {
//        delegate?.optionView(self, selectedOption: selectedOption)
//    }
//}
//
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
//
//}
