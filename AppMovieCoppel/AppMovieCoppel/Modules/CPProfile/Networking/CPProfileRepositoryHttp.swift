//
//  CPLoginRepositoryHttp.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPProfileRepositoryHttp: CPProfileRepository {
    var services: APIService?

    func fetchMoviesFavorite(_ completion: @escaping (Result<CPMovies, NSError>) -> Void) {
        services = APIService()
        let sesionId = CPSession.shared.getStringValue(.sessionId)
        let endPoint = "account/1/favorite/movies?sort_by=created_at.desc&language=es-MX&api_key=\(CPSetting.apiKey)&session_id=\(sesionId)"
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
    func fetchAccount(_ completion: @escaping (Result<CPAccount, NSError>) -> Void) {
        services = APIService()
        let endPoint = "account?api_key=\(CPSetting.apiKey)&session_id=\(CPSession.shared.getStringValue(.sessionId))"
        services?.apiRequest(endPoint,
                             CPAccount.self,
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
