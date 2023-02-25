//
//  Date+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import Foundation

extension Date {
    func formatter(_ typeFormart: CPFormatDate) -> String? {
        let df = DateFormatter()
        df.locale = Locale(identifier: "es_MX")
        df.dateFormat = typeFormart.rawValue
        return df.string(from: self)
    }
}
