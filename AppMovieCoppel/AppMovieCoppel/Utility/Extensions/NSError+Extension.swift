//
//  NSError+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
extension NSError {
    func loadErrorGeneric(message: String = Localizable.text(.serviceNotAvailable)) -> NSError {
        return NSError(domain: Bundle.main.bundleIdentifier!, code: 404, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
