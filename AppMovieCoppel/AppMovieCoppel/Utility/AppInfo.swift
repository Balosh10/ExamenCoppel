//
//  AppInfo.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
import UIKit

struct AppInfo {

    static var shared:AppInfo {
        return AppInfo()
    }

    var environment: String  {
        return readFromInfoPlist(withKey: "Configuration") ?? ""
    }
    
    var developer: String { return "Osvaldo Cespedes Hernandez" }

    // lets hold a reference to the Info.plist of the app as Dictionary
    private let infoPlistDictionary = Bundle.main.infoDictionary

    /// Retrieves and returns associated values (of Type String) from info.Plist of the app.
    private func readFromInfoPlist(withKey key: String) -> String? {
        return infoPlistDictionary?[key] as? String
    }
    
}



