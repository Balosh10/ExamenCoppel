//
//  MoviesModel.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
struct MoviesModel: Codable {
    var title: String?
    var type: String?
    var results: [CPCollectionMovies]?
}
