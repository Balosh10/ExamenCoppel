//
//  CPTextField.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

open class CPTextField: UITextField {
    
    private var placeholderItem = UILabel()
    
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
        textColor = .black
        placeholderItem.font =  CPFont.gothamBook.size(.smail)
        placeholderItem.textAlignment = .left
        placeholderItem.textColor = UIColor.CPText100
        addSubview(placeholderItem)
        placeholderItem.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderItem.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            placeholderItem.bottomAnchor.constraint(equalTo: topAnchor, constant: -4),
            placeholderItem.heightAnchor.constraint(equalToConstant:  12 ),
            
        ])
    }
    
    func actionTarget(target: UIViewController,action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action:action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    func setText(text: String = "", placeholder: String = "") {
        self.text = text
        placeholderItem.text = placeholder
    }
    
    func removeErrorMessage() {
        placeholderItem.text = nil
    }
    
    func setErrorMessage(_ error: String, color: ColorStyle = .CPText100) {
        placeholderItem.text = error
        placeholderItem.textColor = color.color
    }
    
    func removeViewShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
    }
}

