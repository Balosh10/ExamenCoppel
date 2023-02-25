//
//  CPDashboardPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPAiringTodayPresenter  {
    
    // MARK: Properties
    weak var view: CPAiringTodayViewProtocol?
    var interactor: CPAiringTodayInteractorInputProtocol?
    var router: CPAiringTodayRouterProtocol?
    
}

extension CPAiringTodayPresenter: CPAiringTodayPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.fechtMovie()
    }
    
}

extension CPAiringTodayPresenter: CPAiringTodayInteractorOutputProtocol {
    
    func showInfo(message: String) {
        CPLoader.hide()
        view?.showError(message: message)
    }
    
    func loadData(movies: [CPCollectionMovies], type: CPList) {
        CPLoader.hide()
        view?.loadData(movies: movies, type: type)
    }
    
}
