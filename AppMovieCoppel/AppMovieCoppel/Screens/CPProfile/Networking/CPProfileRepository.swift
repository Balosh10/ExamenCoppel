//
//  PRLoginRepository.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

protocol CPProfileRepository: AnyObject {
    func fetchMoviesFavorite(_ completion: @escaping(Result<CPMovies, NSError>) -> Void)
    func fetchAccount(_ completion: @escaping(Result<CPAccount, NSError>) -> Void)
    
}

