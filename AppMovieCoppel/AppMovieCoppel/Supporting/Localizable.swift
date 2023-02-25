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
    enum LoginView: String, LocalizableDelegate {
        case username
        case password
        case credentialsRequired
        case authenticationFailed
    }
    enum TapBar: String, LocalizableDelegate {
        case tvShow
    }
    enum DetailMovie: String, LocalizableDelegate {
        case companies
    }
    enum Profile: String, LocalizableDelegate {
        case profile
        case favoriteShows
    }
    enum ErrorService: String, LocalizableDelegate {
        case withoutInternet
        case serviceNotAvailable
    }
    static func text(_ description: LoginView) -> String {
        return description.localized
    }
    static func text(_ description: ErrorService) -> String {
        return description.localized
    }
    static func text(_ description: TapBar) -> String {
        return description.localized
    }
    static func text(_ description: DetailMovie) -> String {
        return description.localized
    }
    static func text(_ description: Profile) -> String {
        return description.localized
    }
}
