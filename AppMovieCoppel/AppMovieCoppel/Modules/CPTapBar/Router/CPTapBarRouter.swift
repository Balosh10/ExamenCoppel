//
//  CPTapBarRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPTapBarRouter: CPTapBarRouterProtocol {

    class func createCPTapBarModule() -> UIViewController {
        let view: CPTapBarViewProtocol = CPTapBarView()
        let presenter: CPTapBarPresenterProtocol & CPTapBarInteractorOutputProtocol = CPTapBarPresenter()
        let interactor: CPTapBarInteractorInputProtocol & CPTapBarRemoteDataManagerOutputProtocol = CPTapBarInteractor()
        let localDataManager: CPTapBarLocalDataManagerInputProtocol = CPTapBarLocalDataManager()
        let remoteDataManager: CPTapBarRemoteDataManagerInputProtocol = CPTapBarRemoteDataManager()
        let router: CPTapBarRouterProtocol = CPTapBarRouter()
        
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
