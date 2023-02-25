//
//  PRLoginRepository.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

protocol CPMovieRepository: AnyObject {
    func fetchMovies(_ list: CPList,
                     _ result: CPResult,
                     _ completion: @escaping(Result<CPMovies, NSError>) -> Void)
}

