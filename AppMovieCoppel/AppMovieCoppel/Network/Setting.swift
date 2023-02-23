//
//  Setting.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation
struct Setting {
    static var activePrintRequest: Bool = true
    static var accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDA5ZDFiMTFkZWRiNWFlZTNmOWI1NjE3YjhhNDJjMiIsInN1YiI6IjVmZTEwZjZlYWI2ODQ5MDAzZjdmNzM4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L5FK8ilJjbClDwfCzhR8ZWbcjMRnb7xDY5m3b-LOVns"
    static var apiKey = "4009d1b11dedb5aee3f9b5617b8a42c2"
    static var imageBase = "https://image.tmdb.org/t/p/original"
    static var baseGateway: String {
        switch Environment.init(rawValue: AppInfo.shared.environment){
            case .Development:
                return "https://api.themoviedb.org/3"
            case .Production:
                return ""
            case .QA:
                return ""
            default:
                return ""
        }
    }
    
}