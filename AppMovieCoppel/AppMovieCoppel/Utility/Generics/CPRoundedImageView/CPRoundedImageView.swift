//
//  CPRoundedImageView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import UIKit

@IBDesignable
class CPRoundedImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 { didSet { setUpView() } }

    func setUpView() {
        self.clipsToBounds = true
        setTopCornerRadius(rect: self.bounds)
    }

    func setTopCornerRadius(rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:[.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
    }
}
