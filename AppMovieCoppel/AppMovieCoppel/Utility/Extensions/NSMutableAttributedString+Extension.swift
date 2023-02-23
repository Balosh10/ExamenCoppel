//
//  NSMutableAttributedString.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

extension NSMutableAttributedString {
    
    func boldText(_ value: String,
                  _ color: UIColor = UIColor.CPWhite100,
                  _ alignment: NSTextAlignment = .center,
                  _ size: CPSizeTitle = .smail,
                  _ background: UIColor = UIColor.clear) -> NSMutableAttributedString {
        
        var attributes:[NSAttributedString.Key: Any] = [:]
        attributes[.font] = CPFont.gothamBook.size(size)
        attributes[.foregroundColor] = color
        attributes[.backgroundColor] = background
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        return self
    }
    
    func normal(_ value: String,
                _ color: UIColor = UIColor.CPText100,
                _ alignment: NSTextAlignment = .center,
                _ size: CPSizeTitle = .medium,
                isBold: Bool = false) -> NSMutableAttributedString {
        let font = isBold ? CPFont.gothamMedium.size(size) : CPFont.gothamBook.size(size)
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = color
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        return self
    }
    
    /* Other styling methods */
    func blackHighlight(_ value: String,
                        _ color: UIColor = UIColor.CPText100,
                        _ alignment: NSTextAlignment = .center,
                        _ size: CPSizeTitle = .medium,
                        _ backgroundColor: UIColor = .black,
                        _ isBold: Bool = false) -> NSMutableAttributedString {
        let font = isBold ? CPFont.gothamMedium.size(size) : CPFont.gothamBook.size(size)
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = color
        attributes[.backgroundColor] = backgroundColor
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        
        return self
    }
    
    func underlined(_ value: String,
                    _ color: UIColor = UIColor.CPText100,
                    _ alignment: NSTextAlignment = .center,
                    _ size: CPSizeTitle = .medium,
                    _ isBold:Bool = false) -> NSMutableAttributedString {
        var attributes:[NSAttributedString.Key: Any] = [:]
        attributes[.font] = CPFont.gothamBook.size(size)
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.foregroundColor] = color
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        
        return self
        
    }
    func formatTitleLineal(text: String,
                           textColor: UIColor = UIColor.CPText100)  -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        var properties: [String: Any] = [:]
        properties[convertFromNSAttributedStringKey(NSAttributedString.Key.underlineStyle)] = 1
        properties[convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)] = textColor
        properties[convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle)] = style
        properties[convertFromNSAttributedStringKey(NSAttributedString.Key.font)] = CPFont.gothamMedium.size(.medium)
        let attributedText:NSAttributedString = NSAttributedString(string: text,
                                                                   attributes: convertToOptionalNSAttributedStringKeyDictionary(properties))
        return attributedText
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
        guard let input = input else { return nil }
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
        return input.rawValue
    }
    
    func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
    }
    
    func lineSpacing(_ lineSpacing: CGFloat = 6,
                     _ alignment: NSTextAlignment = .center) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
    }
}
