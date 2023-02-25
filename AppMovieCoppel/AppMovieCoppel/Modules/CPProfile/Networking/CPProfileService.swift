//
//  CPLoginService.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPProfileService {
    let repository: CPProfileRepository
    init(repository: CPProfileRepository) {
        self.repository = repository
    }
    func fetchMoviesFavorite(_ completion: @escaping(Result<CPMovies, NSError>) -> Void){
        repository.fetchMoviesFavorite(completion)
    }
    func fetchAccount(_ completion: @escaping(Result<CPAccount, NSError>) -> Void){
        repository.fetchAccount(completion)
    }
    
    
}
