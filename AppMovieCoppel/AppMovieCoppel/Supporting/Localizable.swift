//
//  Localizable.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

protocol LocalizableDelegate {
    var rawValue: String { get }
    var table: String? { get }
    var localized: String { get }
}

extension LocalizableDelegate {
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }
    var table: String? {
        return nil
    }
}

enum Localizable {
    enum loginView: String, LocalizableDelegate {
        case username
        case password
    }
    enum errorService: String, LocalizableDelegate {
        case withoutInternet
        case serviceNotAvailable

    }
    static func text(_ description: loginView) -> String {
        return description.localized
    }
    static func text(_ description: errorService) -> String {
        return description.localized
    }
}
