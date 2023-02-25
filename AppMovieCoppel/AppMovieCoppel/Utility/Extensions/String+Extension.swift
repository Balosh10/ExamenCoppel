//
//  String+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import Foundation

extension String {
    func formatter(_ typeFormart: CPFormatDate) -> Date? {
        let df = DateFormatter()
        df.locale = Locale(identifier: "es_MX")
        df.dateFormat = typeFormart.rawValue
        return df.date(from: self)
    }
}
