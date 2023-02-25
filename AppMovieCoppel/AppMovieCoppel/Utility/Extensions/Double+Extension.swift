//
//  Double+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import Foundation

extension Double {
    func toString(toPlaces places: Int = 0) -> String {
        return String(format: "%.\(places)f", self)
    }
}
