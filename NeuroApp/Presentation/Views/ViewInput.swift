//
//  ViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import UIKit

protocol ViewInput {
    func show(_ error: Error)
}

extension ViewInput {
    func show(_ error: Error) {
        guard let vc = self as? UIViewController else {
            return
        }
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
