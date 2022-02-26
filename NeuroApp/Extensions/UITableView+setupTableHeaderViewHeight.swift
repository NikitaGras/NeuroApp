//
//  UITableView+setupTableHeaderViewHeight.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.12.2021.
//

import UIKit

extension UITableView {
    func setupTableHeaderViewHeight() {
        guard let tableHeaderView = self.tableHeaderView else {
            return
        }
        let height = tableHeaderView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        tableHeaderView.frame.size.height = height
    }
}
