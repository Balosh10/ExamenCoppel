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
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.initUI()
    }
}

extension CPAiringTodayPresenter: CPAiringTodayInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
