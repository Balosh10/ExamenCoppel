//
//  CPColor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

@objc public enum ColorStyle: Int {
    
    case CPPrincipal = 1
    case CPSecundary = 2
    case CPText100 = 3
    
    public var color : UIColor {
        switch self {
            case .CPPrincipal:
                return .CPPrincipal
            case .CPSecundary:
                return .CPSecundary
            case .CPText100:
                return .CPText100
        }
    }
    
    internal func colorWith(value: Int) -> UIColor {
        return ColorStyle(rawValue: value)?.color ?? .clear
    }
}
