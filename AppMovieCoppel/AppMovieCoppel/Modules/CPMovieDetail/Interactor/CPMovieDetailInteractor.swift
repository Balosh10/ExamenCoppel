//
//  CPMovieDetailInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation

class CPMovieDetailInteractor: CPMovieDetailInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: CPMovieDetailInteractorOutputProtocol?
    var remoteDatamanager: CPMovieDetailRemoteDataManagerInputProtocol?
    var movies: CPMovieDetail?

    func getMovieData() {
        guard let movies = movies else { return }
        presenter?.loadInfoMovie(item: movies)
    }

}

extension CPMovieDetailInteractor: CPMovieDetailRemoteDataManagerOutputProtocol {
}
