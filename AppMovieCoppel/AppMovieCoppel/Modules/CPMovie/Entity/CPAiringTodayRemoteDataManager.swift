//
//  CPDashboardRemoteDataManager.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPAiringTodayRemoteDataManager:CPAiringTodayRemoteDataManagerInputProtocol {
 
    
    var remoteRequestHandler: CPDashboardRemoteDataManagerOutputProtocol?
    var movieService: CPMovieService?
    
    func fechtMovie(_ list: CPList, _ result: CPResult) {
        movieService = CPMovieService(repository: CPMovieRepositoryHttp())
        movieService?.fetchMovies(list, result) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    self.remoteRequestHandler?.loadData(movies: result)
                case .failure(let failure):
                    self.remoteRequestHandler?.showError(message: failure.localizedDescription)
            }
            self.movieService = nil
        }
    }
}
