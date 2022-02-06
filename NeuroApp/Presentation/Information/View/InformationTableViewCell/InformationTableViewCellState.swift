//
//  InformationTableViewCellState.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05.02.2022.
//

import UIKit

protocol InformationTableViewCellState {
    func update(_ cell: InformationTableViewCell)
    func animate(_ cell: InformationTableViewCell, rotationAngle: CGFloat)
}

extension InformationTableViewCellState {
    func animate(_ cell: InformationTableViewCell, rotationAngle: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            cell.arrowImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}

class InformationCellOpenState: InformationTableViewCellState {
    func update(_ cell: InformationTableViewCell) {
        cell.informationLabel.numberOfLines = 0
        animate(cell, rotationAngle: CGFloat.pi)
    }
}

class InformationCellClosedState: InformationTableViewCellState {
    func update(_ cell: InformationTableViewCell) {
        cell.informationLabel.numberOfLines = 2
        animate(cell, rotationAngle: CGFloat.pi * 2)
    }
}
