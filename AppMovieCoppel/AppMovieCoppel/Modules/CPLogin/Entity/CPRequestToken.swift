//
//  CPRequestToken.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

struct CPRequestToken: Codable {
    let success, failure: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success, failure
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
