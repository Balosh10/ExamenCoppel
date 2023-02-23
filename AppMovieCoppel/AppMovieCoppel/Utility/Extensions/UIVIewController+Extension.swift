//
//  UIVIewController+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
import UIKit

@nonobjc extension UIViewController {

    func statusBarView(color: UIColor = UIColor.CPPrincipal, isGradient: Bool = false) {
        let main = UIScreen.main.bounds
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            if keyWindow != nil {
                let statusBar = UIView(frame: (keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
                if isGradient {
                    statusBar.applyGradient(width: main.width,
                                            height: main.height,
                                            color: [UIColor.CPPrincipal.cgColor,
                                                    UIColor.CPPrincipal.cgColor,
                                                    UIColor.CPPrincipal.cgColor])
                } else {
                    statusBar.backgroundColor = color
                }
                keyWindow?.addSubview(statusBar)
            }
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            if let statusBar = statusBar {
                if isGradient {
                    statusBar.applyGradient(width: main.width,
                                            height: main.height,
                                            color: [UIColor.CPPrincipal.cgColor,
                                                    UIColor.CPPrincipal.cgColor,
                                                    UIColor.CPPrincipal.cgColor])
                } else {
                    statusBar.backgroundColor = color
                }
            }
        }
    }
}
