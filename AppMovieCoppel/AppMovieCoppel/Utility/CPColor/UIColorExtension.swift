//
//  UIColorExtension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

enum colorType: String {
    case principal = "#46AA0E"
    case secundary = "#05771A"
    case text100 = "#9F9F9F"
    case white100 = "#FFFFFF"
    case base100 = "#FBFBFB"
    case red100 = "#D14722"
    case gray100 = "#C6C6C6"
}

extension UIColor {
    static var CPPrincipal: UIColor {
        return .getColorWith(hex: colorType.principal.rawValue)
    }
    static var CPSecundary: UIColor {
        return .getColorWith(hex: colorType.secundary.rawValue)
    }
    static var CPText100: UIColor {
        return .getColorWith(hex: colorType.text100.rawValue)
    }
    static var CPWhite100: UIColor {
        return .getColorWith(hex: colorType.white100.rawValue)
    }
    static var CPBase100: UIColor {
        return .getColorWith(hex: colorType.base100.rawValue)
    }
    static var CPRed100: UIColor {
        return .getColorWith(hex: colorType.red100.rawValue)
    }
    static var CPGray100: UIColor {
        return .getColorWith(hex: colorType.gray100.rawValue)
    }
}
extension UIColor {
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    private func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    static func getColorWith(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count) != 6 {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha)
    }
}

