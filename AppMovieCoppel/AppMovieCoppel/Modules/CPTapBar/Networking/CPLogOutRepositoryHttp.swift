//
//  CPLogOutRepositoryHttp.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation

class CPLogOutRepositoryHttp: CPLogOutRepository {
    var services: APIService?

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
