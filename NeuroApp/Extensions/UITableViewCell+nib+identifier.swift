//
//  UITableViewCell+nib+identifier.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
