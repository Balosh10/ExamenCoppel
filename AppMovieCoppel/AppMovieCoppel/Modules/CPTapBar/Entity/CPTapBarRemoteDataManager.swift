//
//  CPTapBarRemoteDataManager.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPTapBarRemoteDataManager:CPTapBarRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CPTapBarRemoteDataManagerOutputProtocol?
    var logOutService: CPLogOutService?
    
    func logOut() {
        logOutService = CPLogOutService(repository: CPLogOutRepositoryHttp())
        logOutService?.createDeleteSesion() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    if result.success {
                        CPSession.shared.singOut()
                        self.remoteRequestHandler?.presentLogin()
                    } else  {
                        self.remoteRequestHandler?.showInfo(message: Localizable.text(.serviceNotAvailable))
                    }
                case .failure(let failure):
                    self.remoteRequestHandler?.showInfo(message: failure.localizedDescription)
            }
            self.logOutService = nil
        }
    }
}
