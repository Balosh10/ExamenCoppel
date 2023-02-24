//
//  UIVIewController+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
import UIKit

@nonobjc extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        for scene in UIApplication.shared.connectedScenes {
            if scene == currentScene,
               let delegate = scene.delegate as? SceneDelegate {
                return delegate
            }
        }
        return nil
    }
    func statusBarView(color: UIColor = UIColor.CPPrincipal) {
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
                statusBar.backgroundColor = color
                keyWindow?.addSubview(statusBar)
            }
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            if let statusBar = statusBar {
                statusBar.backgroundColor = color
            }
        }
    }
    func removeChild(_ child: UIViewController) {
        // Notify Child View Controller
        child.willMove(toParent: nil)
        // Remove Child View From Superview
        child.view.removeFromSuperview()
        // Notify Child View Controller
        child.removeFromParent()
    }
    func removeChild() {
        self.children.forEach({
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        })
    }
    func showVC(asChildViewController viewController: UIViewController) {
        removeChild(viewController)
        addSelectChild(viewController)
    }
    func showMenu(asChildViewController viewController: UIViewController) {
        removeChild(viewController)
        addMenuChild(viewController)
    }
    func addMenuChild(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.view.frame = view.bounds
        view.backgroundColor = UIColor.clear
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            child.view.heightAnchor.constraint(equalToConstant: 44)
        ])
        child.view.backgroundColor = .clear
    }
    
    func addSelectChild(_ child: UIViewController){
        addChild(child)
        view.addSubview(child.view)
        child.view.frame = view.bounds
        view.backgroundColor = UIColor.clear
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
        ])
        child.view.backgroundColor = .clear
    }
}
