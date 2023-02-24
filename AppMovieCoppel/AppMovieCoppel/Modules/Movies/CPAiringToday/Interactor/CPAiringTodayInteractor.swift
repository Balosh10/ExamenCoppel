//
//  CPDashboardInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPAiringTodayInteractor: CPAiringTodayInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPAiringTodayInteractorOutputProtocol?
    var localDatamanager: CPAiringTodayLocalDataManagerInputProtocol?
    var remoteDatamanager: CPAiringTodayRemoteDataManagerInputProtocol?

}

extension CPAiringTodayInteractor: CPDashboardRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
