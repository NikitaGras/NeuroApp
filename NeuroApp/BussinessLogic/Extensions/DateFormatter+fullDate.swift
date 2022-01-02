//
//  DateFormatter+fullDate.swift
//  NeuroApp
//
//  Created by Nikita Gras on 30.12.2021.
//

import Foundation

extension DateFormatter {
    static let fulldate: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("dd MMMM YYYY")
        return df
    }()
}
