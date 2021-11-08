//
//  CGPoint+getOrigin.swift
//  NeuroApp
//
//  Created by Nikita Gras on 08.11.2021.
//

import UIKit

extension CGPoint {
    static func getOrigin(for index: Int, with columnNumber: Int, width: CGFloat, height: CGFloat, margin: CGFloat) -> CGPoint {
        let index = index + 1
        let columnIndex = CGFloat((columnNumber - index % columnNumber) - 1)
        let lineIndex = CGFloat((index % columnNumber + index / columnNumber) - 1)
        return CGPoint(x: (width + margin) * columnIndex,
                       y: (height + margin) * lineIndex)
    }
}
