//
//  CPLogOutService.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation

class CPLogOutService {
    let repository: CPLogOutRepository
    init(repository: CPLogOutRepository) {
        self.repository = repository
    }
    func createDeleteSesion(_ completion: @escaping(Result<CPDeleteSesion, NSError>) -> Void){
        repository.createDeleteSesion(completion)
    }
}
