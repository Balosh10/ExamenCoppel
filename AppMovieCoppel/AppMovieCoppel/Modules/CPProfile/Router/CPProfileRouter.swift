//
//  CPProfileRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

class CPProfileRouter: CPProfileRouterProtocol {

    class func createCPProfileModule() -> UIViewController {
        let view: CPProfileViewProtocol = CPProfileView()
        let presenter: CPProfilePresenterProtocol & CPProfileInteractorOutputProtocol = CPProfilePresenter()
        let interactor: CPProfileInteractorInputProtocol & CPProfileRemoteDataManagerOutputProtocol = CPProfileInteractor()
        let localDataManager: CPProfileLocalDataManagerInputProtocol = CPProfileLocalDataManager()
        let remoteDataManager: CPProfileRemoteDataManagerInputProtocol = CPProfileRemoteDataManager()
        let router: CPProfileRouterProtocol = CPProfileRouter()
        
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
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "CPProfileView", bundle: Bundle.main)
    }
    
}
