//
//  UITableView+registerCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import UIKit

extension UITableView {
    func register(cell cellType: UITableViewCell.Type) {
        self.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
}
