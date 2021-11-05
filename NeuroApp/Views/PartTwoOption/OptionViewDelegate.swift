//
//  OptionViewDelegate.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.11.2021.
//

import Foundation
import UIKit

protocol OptionViewDelegate: AnyObject {
    func optionView(_ view: UIView, selectedOption: Option)
}
