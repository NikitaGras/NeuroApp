//
//  RoundButton.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import UIKit

class RoundButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 3
    }
}
