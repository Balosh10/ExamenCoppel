//
//  CPIcon.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit
import Foundation

enum CpImagen: String {
    case logoMovie
    case background
    case icMenu
    case icStar
}

struct CPIcon {

    static func of(_ name: CpImagen) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}

