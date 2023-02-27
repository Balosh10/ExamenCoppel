//
//  CPDashboardPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPMoviePresenter  {
    
    // MARK: Properties
    weak var view: CPMovieViewProtocol?
    var interactor: CPMovieInteractorInputProtocol?
    var router: CPMovieRouterProtocol?
    
}

extension CPMoviePresenter: CPMoviePresenterProtocol {
    
    func viewDidLoad() {
        view?.initUI()
        interactor?.fechtMovie()
    }
    
    func fetchMovieDetail( _ id: Int) {
        interactor?.fetchMovieDetail(id)
    }
    
}

extension CPMoviePresenter: CPMovieInteractorOutputProtocol {
    func loadMovieDetail(movieDatailData: CPMovieDetailData) {
        CPLoader.hide()
        router?.presentMovieDetail(from: view, movieDatailData: movieDatailData)
    }
    
    func showInfo(message: String) {
        CPLoader.hide()
        view?.showError(message: message)
    }
    
    func loadData(movies: [CPCollectionMovies], type: CPList) {
        CPLoader.hide()
        view?.loadData(movies: movies, type: type)
    }
    
    func backgroundView(message: String) {
        router?.presentBackground(from: view, message: message)
    }
}
