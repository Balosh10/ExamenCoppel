//
//  Setting.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
struct CPSetting {
    static var activePrintRequest: Bool = true
    static var accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDA5ZDFiMTFkZWRiNWFlZTNmOWI1NjE3YjhhNDJjMiIsInN1YiI6IjVmZTEwZjZlYWI2ODQ5MDAzZjdmNzM4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L5FK8ilJjbClDwfCzhR8ZWbcjMRnb7xDY5m3b-LOVns"
    static var apiKey = "4009d1b11dedb5aee3f9b5617b8a42c2"
    static var imageBase = "https://image.tmdb.org/t/p/original"
    
    #warning("Set up test environments")
    static var baseGateway: String {
        switch Environment.init(rawValue: CPAppInfo.shared.environment){
            case .Development, .Production, .QA:
                return "https://api.themoviedb.org/3"
            default:
                return "https://api.themoviedb.org/3"
        }
    }
    static var activateTestUser: Bool = true
    static var user = "osvaldo.cespedes"
    static var password = "Movie2023"
}
