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
    var localDatamanager: CPLoginLocalDataManagerInputProtocol?
    var remoteDatamanager: CPLoginRemoteDataManagerInputProtocol?

}

extension CPLoginInteractor: CPLoginRemoteDataManagerOutputProtocol {
}
