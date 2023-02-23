//
//  CPLoginRepositoryHttp.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPLoginRepositoryHttp: CPLoginRepository {
    var services: APIService?

    func createGuestSessionNew(_ completion: @escaping (Result<CPGuestSessionNew, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/token/new?api_key=\(Setting.apiKey)",
                             CPGuestSessionNew.self,
                             .put) { result in
            switch result {
            case .success(let objct):
                completion(.success(objct))
            case .failure(let failure):
                completion(.failure(failure))
            }
            self.services = nil
        }
    }
    
    func createRequestToken(_ completion: @escaping (Result<CPRequestToken, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/token/new?api_key=\(Setting.apiKey)",
                             CPRequestToken.self,
                             .post,
                             ["request_token": CPSession.shared.getStringValue(.request_token)]) { result in
            switch result {
            case .success(let objct):
                completion(.success(objct))
            case .failure(let failure):
                completion(.failure(failure))
            }
            self.services = nil
        }
    }
    
    func createSesionWithLogin(_ userName: String, _ password: String, _ completion: @escaping (Result<CPSesionUser, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/token/new?api_key=\(Setting.apiKey)",
                             CPSesionUser.self,
                             .post,
                             ["username": userName,
                              "password": password,
                              "request_token": CPSession.shared.getStringValue(.request_token)]) { result in
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
