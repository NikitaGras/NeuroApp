//
//  UIButton+setBackgroundColor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: size))
            let imageColor = UIGraphicsGetImageFromCurrentImageContext()
            setBackgroundImage(imageColor, for: state)
        }
        UIGraphicsEndImageContext()
    }
}
