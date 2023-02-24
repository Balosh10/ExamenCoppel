//
//  CPBackgroundRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPBackgroundRouter: CPBackgroundRouterProtocol {
    class func createCPBackgroundModule() -> UIViewController {
        let view: CPBackgroundViewProtocol = CPBackgroundView()
        let presenter: CPBackgroundPresenterProtocol & CPBackgroundInteractorOutputProtocol = CPBackgroundPresenter()
        let interactor: CPBackgroundInteractorInputProtocol = CPBackgroundInteractor()
        let router: CPBackgroundRouterProtocol = CPBackgroundRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view
    }
    
    func presentDashboard(from view: CPBackgroundViewProtocol?) {
        guard let newView = view as? CPBackgroundView else { return }
        newView.sceneDelegate?.showHomeView()
    }
    
    func presentLogin(from view: CPBackgroundViewProtocol?) {
        guard let newView = view as? CPBackgroundView else { return }
        newView.sceneDelegate?.showLoginView()
    }
}
