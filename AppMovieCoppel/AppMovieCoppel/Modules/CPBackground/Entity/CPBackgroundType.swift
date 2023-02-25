//
//  CPBackgroundType.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import Foundation

enum CPBackgroundType {
    case logOut
    case background
}

struct CPDataBackground {
    var type: CPBackgroundType = .background
    var message: String?
    init() {
        
    }
}
