//
//  DoubleSidedArrowView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 02.01.2022.
//

import UIKit

class DoubleSidedArrowView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        guard let context = context else {
            return
        }
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.black.cgColor)
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.height / 2, y: 0))
        context.move(to: CGPoint(x: 0, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.height / 2, y: rect.height))
        context.move(to: CGPoint(x: rect.width, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: 0))
        context.move(to: CGPoint(x: rect.width, y: rect.height / 2))
        context.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: rect.height))
        context.strokePath()
    }
}
