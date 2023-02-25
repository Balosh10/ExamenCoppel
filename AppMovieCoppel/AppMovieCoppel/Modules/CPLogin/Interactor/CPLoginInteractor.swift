//
//  CPLoginInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation

class CPLoginInteractor: CPLoginInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPLoginInteractorOutputProtocol?
    var remoteDatamanager: CPLoginRemoteDataManagerInputProtocol?

    func logIn(_ name: String, _ password: String) {
        remoteDatamanager?.logIn(name, password)
    }
}

extension CPLoginInteractor: CPLoginRemoteDataManagerOutputProtocol {
    func showInfo(message: String) {
        presenter?.showInfo(message: message)
    }
    func presentDashboard() {
        presenter?.presentDashboard()
    }
}
