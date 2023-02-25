//
//  CPLoginService.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class CPMovieService {
    let repository: CPMovieRepository
    init(repository: CPMovieRepository) {
        self.repository = repository
    }
    func fetchMovies(_ list: CPList,
                     _ result: CPResult,
                     _ completion: @escaping(Result<CPMovies, NSError>) -> Void) {
        repository.fetchMovies(list, result, completion)
    }
    func fetchMovieDetail(_ list: CPList,
                          _ id: Int,
                          _ completion: @escaping(Result<CPMovieDetail, NSError>) -> Void) {
        repository.fetchMovieDetail(list, id, completion)
    }
}
