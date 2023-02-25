//
//  CollectionMoviesModel.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation

struct CPCollectionMovies: Codable  {
    var title: String?
    var type: String?
    var id: Int?
    var posterPath: String?
    var voteCount: Double?
    var releaseDate: String?
    var overview: String?
    var firstAirDate: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case type
        case id
        case overview
        case name
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
    }
    
}
