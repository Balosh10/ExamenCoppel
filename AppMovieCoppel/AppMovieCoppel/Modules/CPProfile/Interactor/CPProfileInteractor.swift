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
    var localDatamanager: CPProfileLocalDataManagerInputProtocol?
    var remoteDatamanager: CPProfileRemoteDataManagerInputProtocol?

}

extension CPProfileInteractor: CPProfileRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
