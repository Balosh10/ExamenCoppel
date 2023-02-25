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
    func load(url: URL) {
       DispatchQueue.global().async { [weak self] in
           if let data = try? Data(contentsOf: url) {
               if let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self?.image = image
                   }
               }
           }
       }
   }
}
