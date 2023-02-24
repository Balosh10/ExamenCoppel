//
//  UIImageView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation
import UIKit

extension UIImageView {
    func tintColorImg(image: UIImage, color: UIColor) {
        let origImage = image
        let tintedImage = origImage.withRenderingMode(.alwaysTemplate)
        self.image = tintedImage
        tintColor = color
    }
}
