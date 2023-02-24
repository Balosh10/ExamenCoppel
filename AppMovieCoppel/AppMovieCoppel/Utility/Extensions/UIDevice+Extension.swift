//
//  UIDevice+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation
import UIKit
public extension UIDevice {
    public class var isPhone:Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
