//
//  CPDashboardInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPAiringTodayInteractor: CPAiringTodayInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPAiringTodayInteractorOutputProtocol?
    var remoteDatamanager: CPAiringTodayRemoteDataManagerInputProtocol?
    var dataMovie: CPMovieData?

    func fechtMovie() {
        guard let dataMovie = dataMovie else {
            return
        }
        CPLoader.show()
        remoteDatamanager?.fechtMovie(dataMovie.list, dataMovie.result)
    }
    
}

extension CPAiringTodayInteractor: CPDashboardRemoteDataManagerOutputProtocol {
    func showError(message: String) {
        presenter?.showInfo(message: message)
    }
    
    func loadData(movies: CPMovies) {
        guard let dataMovie = dataMovie,
              let result = movies.results else {
            return
        }
        presenter?.loadData(movies: result, type: dataMovie.list)
    }
    
}
