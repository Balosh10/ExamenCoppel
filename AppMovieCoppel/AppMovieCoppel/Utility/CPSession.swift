//
//  CPSession.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

struct CPSession {
    static var shared: CPSession { return CPSession() }
    private var userData: UserDefaults!
    enum Keys: String {
        case expiresAt
        case requestToken
        case sessionId
        case userId
    }
    init() {
        self.userData = UserDefaults.standard
    }
    func saveValue(_ key: Keys, value: Any) {
        self.userData.set(value, forKey: key.rawValue)
        self.userData.synchronize()
    }
    func removeKey(_ key: Keys) {
       self.userData.removeObject(forKey: key.rawValue)
       self.userData.synchronize()
    }
    func getStringValue(_ key: Keys) -> String {
        return self.userData.object(forKey: key.rawValue) as? String ?? ""
    }
    func getBoolValue(_ key: Keys) -> Bool {
        return self.userData.object(forKey: key.rawValue) as? Bool ?? false
    }
    func getIntValue(_ key: Keys) -> Int {
        return self.userData.object(forKey: key.rawValue) as? Int ?? 0
    }
    func getDateValue(_ key: Keys) -> Date? {
        return self.userData.object(forKey: key.rawValue) as? Date
    }
    func getObjectValue(_ key: Keys) -> AnyObject? {
        return self.userData.object(forKey: key.rawValue) as? AnyObject
    }
    func singOut() {
        UserDefaults.clear()
    }
}
