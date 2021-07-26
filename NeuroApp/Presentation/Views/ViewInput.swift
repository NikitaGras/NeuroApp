//
//  ViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import UIKit

protocol ViewInput {
    func show(_ error: Error, handler: ((UIAlertAction) -> Void)?)
}

extension ViewInput {
    func show(_ error: Error, handler: ((UIAlertAction) -> Void)? = nil) {
        guard let vc = self as? UIViewController else {
            return
        }
        let alert = UIAlertController(title: String.error, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
