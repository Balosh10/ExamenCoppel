//
//  CPLoginRepositoryHttp.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPLoginRepositoryHttp: CPLoginRepository {
    var services: APIService?

    func createRequestToken(_ completion: @escaping (Result<CPRequestToken, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/token/new?api_key=\(CPSetting.apiKey)",
                             CPRequestToken.self,
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
    
    func createSesionWithLogin(_ userName: String,
                               _ password: String,
                               _ completion: @escaping (Result<CPSesionUser, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/token/validate_with_login?api_key=\(CPSetting.apiKey)",
                             CPSesionUser.self,
                             .post,
                             ["username": userName,
                              "password": password,
                              "request_token": CPSession.shared.getStringValue(.requestToken)]) { result in
            switch result {
            case .success(let objct):
                completion(.success(objct))
            case .failure(let failure):
                completion(.failure(failure))
            }
            self.services = nil
        }
    }
    
    func createGuestSessionNew(_ completion: @escaping (Result<CPGuestSessionNew, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/session/new?api_key=\(CPSetting.apiKey)",
                             CPGuestSessionNew.self,
                             .post,
                             ["request_token": CPSession.shared.getStringValue(.requestToken)]) { result in
            switch result {
            case .success(let objct):
                completion(.success(objct))
            case .failure(let failure):
                completion(.failure(failure))
            }
            self.services = nil
        }
    }
    
    func createDeleteSesion(_ completion: @escaping (Result<CPDeleteSesion, NSError>) -> Void) {
        services = APIService()
        services?.apiRequest("authentication/session?api_key=\(CPSetting.apiKey)",
                             CPDeleteSesion.self,
                             .delete,
                             ["session_id": CPSession.shared.getStringValue(.sessionId)]) { [weak self] result in
            guard let self = self else { return }
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
