//
//  CPLoginRepositoryHttp.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPMovieRepositoryHttp: CPMovieRepository {
    var services: APIService?

    func fetchMovies(_ list: CPList,
                     _ result: CPResult,
                     _ completion: @escaping (Result<CPMovies, NSError>) -> Void) {
        services = APIService()
        let endPoint = "\(list)/\(result)?api_key=\(Setting.apiKey)&language=es-MX&page=1"
        services?.apiRequest(endPoint,
                             CPMovies.self,
                             .get) { result in
            switch result {
            case .success(let objct):
                completion(.success(objct))
            case .failure(let failure):
                completion(.failure(failure))
            }
            self.services = nil
        }
    }
}
