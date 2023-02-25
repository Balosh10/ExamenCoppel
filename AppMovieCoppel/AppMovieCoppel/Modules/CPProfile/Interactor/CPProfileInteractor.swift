//
//  CPProfileInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation

class CPProfileInteractor: CPProfileInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPProfileInteractorOutputProtocol?
    var remoteDatamanager: CPProfileRemoteDataManagerInputProtocol?

    func fechtAccount() {
        remoteDatamanager?.fechtAccount()
    }
}

extension CPProfileInteractor: CPProfileRemoteDataManagerOutputProtocol {
    func loadData(data: CPAccount) {
        presenter?.loadData(data: data)
    }
    func loadDataMovie(data: CPMovies) {
        presenter?.loadDataMovie(data: data)
    }
    func showError(message: String) {
        presenter?.showError(message: message)
    }
}
