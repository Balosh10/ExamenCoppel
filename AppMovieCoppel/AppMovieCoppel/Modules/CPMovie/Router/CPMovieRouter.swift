//
//  CPDashboardRouter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPMovieRouter: CPMovieRouterProtocol {
    
    class func createCPMovieModule(dataMovie: CPMovieData) -> UIViewController {
        let view: CPMovieViewProtocol = CPMoviesView()
        let presenter: CPMoviePresenterProtocol & CPMovieInteractorOutputProtocol = CPMoviePresenter()
        let interactor: CPMovieInteractorInputProtocol & CPMovieRemoteDataManagerOutputProtocol = CPMovieInteractor()
        let remoteDataManager: CPMovieRemoteDataManagerInputProtocol = CPMovieRemoteDataManager()
        let router: CPMovieRouterProtocol = CPMovieRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataMovie = dataMovie
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view
    }
    
    func presentMovieDetail(from view: CPMovieViewProtocol?, movies: CPMovieDetail) {
        guard let newView = view as? CPMoviesView else { return }
        let movieDetail = CPMovieDetailRouter.createCPMovieDetailModule(movies)
        DispatchQueue.main.async {
            movieDetail.modalPresentationStyle = .overFullScreen
            newView.present(movieDetail, animated: true)
        }
    }
}
