//
//  CPTapBarInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPTapBarInteractor: CPTapBarInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPTapBarInteractorOutputProtocol?
    var localDatamanager: CPTapBarLocalDataManagerInputProtocol?
    var remoteDatamanager: CPTapBarRemoteDataManagerInputProtocol?

    func logOut() {
        remoteDatamanager?.logOut()
    }
}

extension CPTapBarInteractor: CPTapBarRemoteDataManagerOutputProtocol {
    func showInfo(message: String) {
        presenter?.showInfo(message: message)
    }
    func presentLogin() {
        presenter?.presentLogin()
    }
}
