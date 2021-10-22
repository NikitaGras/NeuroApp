//
//  StatusView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 22.10.2021.
//

import UIKit

class UserStatusView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 4
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.NAGray.cgColor
    }
    
    func setBorderColor(for status: User.Status) {
        switch status {
        case .none:
            self.layer.borderColor = UIColor.NAGray.cgColor
        case .positive:
            self.layer.borderColor = UIColor.NAGreen.cgColor
        case .negative:
            self.layer.borderColor = UIColor.NARed.cgColor
        }
    }
}
