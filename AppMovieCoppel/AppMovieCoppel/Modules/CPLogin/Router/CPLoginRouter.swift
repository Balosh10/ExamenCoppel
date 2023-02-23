//
//  CPLoginRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation
import UIKit

class CPLoginRouter: CPLoginRouterProtocol {

    class func createCPLoginModule() -> UIViewController {
        let view: CPLoginViewProtocol = CPLoginView()
        let presenter: CPLoginPresenterProtocol & CPLoginInteractorOutputProtocol = CPLoginPresenter()
        let interactor: CPLoginInteractorInputProtocol & CPLoginRemoteDataManagerOutputProtocol = CPLoginInteractor()
        let localDataManager: CPLoginLocalDataManagerInputProtocol = CPLoginLocalDataManager()
        let remoteDataManager: CPLoginRemoteDataManagerInputProtocol = CPLoginRemoteDataManager()
        let router: CPLoginRouterProtocol = CPLoginRouter()
        
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
