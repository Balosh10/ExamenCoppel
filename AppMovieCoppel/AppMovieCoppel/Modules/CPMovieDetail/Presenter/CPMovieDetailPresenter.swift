//
//  CPMovieDetailPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation

class CPMovieDetailPresenter  {
    
    // MARK: Properties
    weak var view: CPMovieDetailViewProtocol?
    var interactor: CPMovieDetailInteractorInputProtocol?
    var router: CPMovieDetailRouterProtocol?
    
}

extension CPMovieDetailPresenter: CPMovieDetailPresenterProtocol {

    func viewDidLoad() {
        view?.initUI()
        interactor?.getMovieData()
    }
}

extension CPMovieDetailPresenter: CPMovieDetailInteractorOutputProtocol {
    func loadInfoMovie(item: CPMovieDetail) {
        view?.loadInfoMovie(item: item)
    }
}
