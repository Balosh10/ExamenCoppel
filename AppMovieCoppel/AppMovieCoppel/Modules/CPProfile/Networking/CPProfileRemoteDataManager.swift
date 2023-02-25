//
//  CPProfileRemoteDataManager.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation

class CPProfileRemoteDataManager:CPProfileRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CPProfileRemoteDataManagerOutputProtocol?
    var profileService: CPProfileService?
    
    func fechtAccount() {
        profileService = CPProfileService(repository: CPProfileRepositoryHttp())
        profileService?.fetchAccount() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    CPSession.shared.saveValue(.userId, value: result.id)
                    self.fechtFavoriteMovie()
                    self.remoteRequestHandler?.loadData(data: result)
                case .failure(let failure):                    
                    if failure.code == 401 {
                        self.remoteRequestHandler?.backgroundView(message: failure.localizedDescription)
                    } else {
                        self.remoteRequestHandler?.showError(message: failure.localizedDescription)
                    }
            }
            self.profileService = nil
        }
    }
    
    func fechtFavoriteMovie() {
        profileService = CPProfileService(repository: CPProfileRepositoryHttp())
        profileService?.fetchMoviesFavorite() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    print(result)
                    self.remoteRequestHandler?.loadDataMovie(data: result)
                case .failure(let failure):
                    self.remoteRequestHandler?.showError(message: failure.localizedDescription)
            }
            self.profileService = nil
        }
    }
}
