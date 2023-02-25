//
//  CPLoginRemoteDataManager.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation

class CPLoginRemoteDataManager: CPLoginRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CPLoginRemoteDataManagerOutputProtocol?
    var loginService: CPLoginService?
    var name: String?
    var password: String?
    func logIn(_ name: String, _ password: String) {
        self.name = name
        self.password = password
        createRequestToken()
    }
    
    func createRequestToken() {
        loginService = CPLoginService(repository: CPLoginRepositoryHttp())
        loginService?.createRequestToken() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    if result.success {
                        CPSession.shared.saveValue(.requestToken, value: result.requestToken)
                        self.createSesionWithLogin()
                    } else  {
                        self.remoteRequestHandler?.showInfo(message: Localizable.text(.serviceNotAvailable))
                    }
                case .failure(let failure):
                    self.remoteRequestHandler?.showInfo(message: failure.localizedDescription)
            }
            self.loginService = nil
        }
    }
    
    func createSesionWithLogin() {
        guard let name = self.name,
              let password = self.password else {
            self.remoteRequestHandler?.showInfo(message: Localizable.text(.credentialsRequired))
            return
        }
        loginService = CPLoginService(repository: CPLoginRepositoryHttp())
        loginService?.createSesionWithLogin(name, password) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    if result.success {
                        CPSession.shared.saveValue(.requestToken, value: result.requestToken)
                        self.createGuestSessionNew()
                    } else  {
                        self.remoteRequestHandler?.showInfo(message: Localizable.text(.serviceNotAvailable))
                    }
                case .failure(let failure):
                    self.remoteRequestHandler?.showInfo(message: failure.localizedDescription)
            }
            self.loginService = nil
        }
    }
    
    func createGuestSessionNew() {
        loginService = CPLoginService(repository: CPLoginRepositoryHttp())
        loginService?.createGuestSessionNew() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let result):
                    if result.success {
                        CPSession.shared.saveValue(.sessionId, value: result.sessionID)
                        self.remoteRequestHandler?.presentDashboard()
                    } else  {
                        self.remoteRequestHandler?.showInfo(message: Localizable.text(.serviceNotAvailable))
                    }
                case .failure(let failure):
                    self.remoteRequestHandler?.showInfo(message: failure.localizedDescription)
            }
            self.loginService = nil
        }
    }
}
