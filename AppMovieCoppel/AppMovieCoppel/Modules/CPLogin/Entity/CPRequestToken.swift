//
//  CPRequestToken.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

struct CPRequestToken: Codable {
    let success: Bool
    let expiresAt, requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
