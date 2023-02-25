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
    var movieDatailData: CPMovieDetailData?

    func getMovieData() {
        guard let movies = movieDatailData else { return }
        presenter?.loadInfoMovie(movieDatailData: movies)
    }

}

