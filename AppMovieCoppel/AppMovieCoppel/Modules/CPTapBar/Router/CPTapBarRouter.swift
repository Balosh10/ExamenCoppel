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
        let remoteDataManager: CPTapBarRemoteDataManagerInputProtocol = CPTapBarRemoteDataManager()
        let router: CPTapBarRouterProtocol = CPTapBarRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
    func presentLogin(from view: CPTapBarViewProtocol?) {
        guard let newView = view as? CPTapBarView else { return }
        newView.sceneDelegate?.showLoginView()
    }
    func presentProfile(from view: CPTapBarViewProtocol?) {
        guard let newView = view as? CPTapBarView else { return }
        let profileView = CPProfileRouter.createCPProfileModule()
        newView.present(profileView, animated: true)
    }
    func presentMovies(from view: CPTapBarViewProtocol?, dataMovie: CPMovieData) {
        guard let newView = view as? CPTapBarView else { return }
        let airingTodayView = CPAiringTodayRouter.createCPAiringTodayModule(dataMovie: dataMovie)
        let menuTop = CPTapBarTop()
        newView.showVC(asChildViewController: airingTodayView)
        newView.showMenu(asChildViewController: menuTop)
    }
}
