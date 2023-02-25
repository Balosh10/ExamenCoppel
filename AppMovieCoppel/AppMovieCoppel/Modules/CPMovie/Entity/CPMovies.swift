//
//  CPMovies.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation
struct CPMovies: Codable {
    var title: String?
    var type: String?
    var results: [CPCollectionMovies]?
}
