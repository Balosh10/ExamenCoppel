//
//  CPMovieDetailRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

class CPMovieDetailRouter: CPMovieDetailRouterProtocol {

    class func createCPMovieDetailModule(_ movies: CPMovieDetail) -> UIViewController {
        let view: CPMovieDetailViewProtocol = CPMovieDetailView()
        let presenter: CPMovieDetailPresenterProtocol & CPMovieDetailInteractorOutputProtocol = CPMovieDetailPresenter()
        let interactor: CPMovieDetailInteractorInputProtocol = CPMovieDetailInteractor()
        let router: CPMovieDetailRouterProtocol = CPMovieDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.movies = movies
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
}
