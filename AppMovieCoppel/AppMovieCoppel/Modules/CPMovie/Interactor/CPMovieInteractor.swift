//
//  CPDashboardInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPMovieInteractor: CPMovieInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: CPMovieInteractorOutputProtocol?
    var remoteDatamanager: CPMovieRemoteDataManagerInputProtocol?
    var dataMovie: CPMovieData?
    
    func fechtMovie() {
        guard let dataMovie = dataMovie else {
            return
        }
        CPLoader.show()
        remoteDatamanager?.fechtMovie(dataMovie.list, dataMovie.result)
    }
    
    func fetchMovieDetail(_ id: Int) {
        guard let list = dataMovie?.list else {
            return
        }
        CPLoader.show()
        remoteDatamanager?.fetchMovieDetail(list, id)
    }
    
}

extension CPMovieInteractor: CPMovieRemoteDataManagerOutputProtocol {
    
    func loadMovieDetail(movieDatailData: CPMovieDetailData) {
        presenter?.loadMovieDetail(movieDatailData: movieDatailData)
    }
    
    func showError(message: String) {
        presenter?.showInfo(message: message)
    }
    
    func loadData(movies: CPMovies) {
        guard let dataMovie = dataMovie,
              let result = movies.results?.sorted(by: { $0.voteCount ?? 0 > $1.voteCount ?? 0 }) else {
            return
        }
        presenter?.loadData(movies: result, type: dataMovie.list)
    }
    
    func backgroundView(message: String) {
        presenter?.backgroundView(message: message)
    }
}
