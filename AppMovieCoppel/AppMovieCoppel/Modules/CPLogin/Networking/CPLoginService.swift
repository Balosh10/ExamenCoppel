//
//  CPLoginService.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPLoginService {
    let repository: CPLoginRepository
    init(repository: CPLoginRepository) {
        self.repository = repository
    }
    func createRequestToken(_ completion: @escaping(Result<CPRequestToken, NSError>) -> Void) {
        repository.createRequestToken(completion)
    }
    func createSesionWithLogin(_ userName: String,
                               _ password: String,
                               _ completion: @escaping(Result<CPSesionUser, NSError>) -> Void) {
        repository.createSesionWithLogin(userName, password, completion)
    }
    func createGuestSessionNew(_ completion: @escaping(Result<CPGuestSessionNew, NSError>) -> Void) {
        repository.createGuestSessionNew(completion)
    }
}
