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
        loginService?.createGuestSessionNew() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let success):
                    if !success.requestToken.isEmpty {
                        CPSession.shared.saveValue(.request_token, value: success.requestToken)
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
    
    func createGuestSessionNew() {
        
    }
    
    func createSesionWithLogin() {
        guard let name = self.name,
              let password = self.password else {
            print("!no hay credenciales")
            return
        }
        loginService = CPLoginService(repository: CPLoginRepositoryHttp())
        loginService?.createSesionWithLogin(name, password) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let success):
                    if !success.requestToken.isEmpty {
                        CPSession.shared.saveValue(.request_token, value: success.requestToken)
                        self.createSesionWithLogin()
                    } else  {
                        print("Error: \(success)")
                    }
                case .failure(let failure):
                    print("Error: \(failure)")
            }
            self.loginService = nil
        }
    }
}
