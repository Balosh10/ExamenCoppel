//
//  CPError.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
struct CPErrorLogin: Codable {
    let success: Bool
    let statusMessage: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}

