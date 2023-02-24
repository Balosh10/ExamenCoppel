//
//  CPTextField.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

open class CPTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    required public init?(coder aDecorder: NSCoder) {
        super.init(coder: aDecorder)
        setupTextField()
    }
    private func setupTextField() {
        backgroundColor = .clear
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        rightViewMode = .always
        backgroundColor = .white
        borderStyle = .none
        autocorrectionType = .no
        textAlignment = .center
        font =  CPFont.gothamMedium.size(.medium)
        textAlignment = .left
        textColor = UIColor.CPText100
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    func actionTarget(target: UIViewController, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action:action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    func setText(text: String) {
        self.text = text
    }
    func setPlaceholder(placeholder: String) {
        self.placeholder = placeholder
    }
}

