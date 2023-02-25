//
//  CPMovieDetail.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation

struct CPMovieDetailData {
    var movie: CPMovieDetail
    var type: CPList
    init(movie: CPMovieDetail, type: CPList) {
        self.movie = movie
        self.type = type
    }
}
struct CPMovieDetail: Codable {

    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let firstAirDate: String?
    let title: String?
    let voteAverage: Double?
    let genres: [CPGenre]?
    let runtime: Int?
    let productionCompanies: [CPProductionCompany]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case title
        case voteAverage = "vote_average"
        case genres
        case runtime
        case productionCompanies = "production_companies"
    }
    
}

struct CPGenre: Codable {
    let id: Int?
    let name: String?
}

struct CPProductionCompany: Codable {
    
    let id: Int?
    let logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
}
