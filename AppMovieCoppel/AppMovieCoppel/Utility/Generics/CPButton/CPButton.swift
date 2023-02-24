//
//  CPButton.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

@IBDesignable class CPButton: UIButton {
    @IBInspectable var title: String = "Button" {
        didSet {
            loadStyle()
        }
    }
    @IBInspectable public var style: Int = 0 {
        didSet {
            styleButton = StyleButton(rawValue: style) ?? .primary
        }
    }
    enum StyleButton: Int {
        case primary = 0
        case secundary = 1
        case transparent = 2
        case backgroundWhite = 3
        case inactive = 4
    }
    public var styleButton: StyleButton = .primary {
        didSet {
            loadStyle()
        }
    }
    internal func loadStyle() {
        isEnabled = false
        layer.borderColor = UIColor.clear.cgColor
        clipsToBounds = true
        switch styleButton {
            case .primary:
                let text = NSMutableAttributedString().boldText(title, .CPWhite100, .center, .large)
                setAttributedTitle(text, for: .normal)
                layer.cornerRadius = 16
                contentHorizontalAlignment = .center
                backgroundColor = .CPPrincipal
                
            case .secundary:
                backgroundColor = .yellow
                let text = NSMutableAttributedString().boldText(title, .CPWhite100, .center, .large)
                setAttributedTitle(text, for: .normal)
                layer.borderWidth = 1
                layer.cornerRadius = 16
                clipsToBounds = true
                contentHorizontalAlignment = .center
                
            case .transparent:
                if let tag = viewWithTag(10) {
                    tag.removeFromSuperview()
                }
                let label = UILabel()
                label.numberOfLines = 0
                label.translatesAutoresizingMaskIntoConstraints = false
                label.tag = 10
                addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
                    label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                    label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                    label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
                ])
                
                backgroundColor = .clear
                let text = NSMutableAttributedString().boldText(title, .CPText100, .left, .large)
                label.attributedText = text
                titleLabel?.text = ""
                setTitle("", for: .normal)
                layer.cornerRadius = 0
                contentHorizontalAlignment = .left
                
            case .backgroundWhite:
                let text = NSMutableAttributedString().boldText(title, .CPText100, .center, .large)
                setAttributedTitle(text, for: .normal)
                layer.borderWidth = 1
                layer.cornerRadius = 16
                contentHorizontalAlignment = .center
                backgroundColor = .CPWhite100

            case .inactive:
                let text = NSMutableAttributedString().boldText(title, .CPWhite100, .center, .large)
                setAttributedTitle(text, for: .normal)
                layer.cornerRadius = 6
                contentHorizontalAlignment = .center
                backgroundColor = .CPGray100
                isEnabled = true
                
        }
    }
}

