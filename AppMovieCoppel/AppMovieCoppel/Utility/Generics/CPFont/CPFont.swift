//
//  CPFont.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

internal enum CPSizeTitle: CGFloat {
    case smail = 12.0
    case medium = 14.0
    case large = 16.0
    case title = 22.0
}

internal enum CPFont: String {
    case gothamMedium = "GothamMedium"
    case gothamBold = "GothamBold"
    case gothamBook = "GothamBook"
    case gothamLight = "GothamLight"
        
    func size(_ sizeTitle: CPSizeTitle = .smail) -> UIFont {
        guard let font = UIFont(name: self.rawValue, size: sizeTitle.rawValue) else  {
            return  UIFont.systemFont(ofSize: 12)
        }
        return font
    }
}

