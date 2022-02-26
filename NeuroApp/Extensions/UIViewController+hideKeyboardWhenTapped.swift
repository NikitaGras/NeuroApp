//
//  UIViewController+hideKeyboardWhenTapped.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.10.2021.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTapped() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
