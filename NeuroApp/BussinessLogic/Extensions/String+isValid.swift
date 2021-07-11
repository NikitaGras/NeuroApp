//
//  String+isValid.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation

extension String {
    func isVaild(_ type: ValidationType) -> Bool {
        let regex = type.regex
        let result = self.range(of: regex, options: .regularExpression, range: nil, locale: nil)
        return (result != nil)
    }
}
