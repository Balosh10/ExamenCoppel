//
//  CPDashboardRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPAiringTodayRouter: CPAiringTodayRouterProtocol {

    class func createCPAiringTodayModule() -> UIViewController {
        let view: CPAiringTodayViewProtocol = CPAiringTodayView()
        let presenter: CPAiringTodayPresenterProtocol & CPAiringTodayInteractorOutputProtocol = CPAiringTodayPresenter()
        let interactor: CPAiringTodayInteractorInputProtocol & CPDashboardRemoteDataManagerOutputProtocol = CPAiringTodayInteractor()
        let localDataManager: CPAiringTodayLocalDataManagerInputProtocol = CPAiringTodayLocalDataManager()
        let remoteDataManager: CPAiringTodayRemoteDataManagerInputProtocol = CPAiringTodayRemoteDataManager()
        let router: CPAiringTodayRouterProtocol = CPAiringTodayRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
    
}
