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
}

internal enum CPFont: String {
    case gothamMedium = "Gotham Medium"
    case gothamBold = "Gotham Bold"
    case gothamBook = "Gotham Book"
    case gothamBook2 = "GothamBook"
    case gothamMedium2 = "GothamMedium"
    case gothamLight2 = "GothamLight"
        
    func size(_ sizeTitle: CPSizeTitle = .smail) -> UIFont {
        guard let font = UIFont(name: self.rawValue, size: sizeTitle.rawValue) else  {
            return  UIFont.systemFont(ofSize: 12)
        }
        return font
    }
}

