//
//  UIView+setupNib.swift
//  NeuroApp
//
//  Created by Nikita Gras on 18.11.2021.
//

import UIKit

extension UIView {
    func setupNib() {
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
    
    func loadFromNib() -> UIView {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: nil)
        let view = nib.instantiate(withOwner: self).first as? UIView
        return view ?? UIView()
    }
}
