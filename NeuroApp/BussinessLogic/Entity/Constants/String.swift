//
//  String+errorDescription.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import Foundation

extension String {
    static let error = "Ошибка"
    
    struct Error {
        static let wrongName = "Неправильно набрано имя"
        static let wrongAge = "Неправильно указан возраст"
        static let wrongEmail = "Неправильно указан email"
    }
}
