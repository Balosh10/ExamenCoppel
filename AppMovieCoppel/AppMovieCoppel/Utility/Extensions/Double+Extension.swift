//
//  Double+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toString(toPlaces places: Int = 0) -> String {
        return String(format: "%.\(places)f", self)
    }
}
