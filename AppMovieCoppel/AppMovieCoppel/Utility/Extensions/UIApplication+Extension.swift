//
//  UIApplication+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
