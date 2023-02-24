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

}

extension CPTapBarInteractor: CPTapBarRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
