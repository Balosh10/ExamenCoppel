//
//  CPTapBarPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPTapBarPresenter  {
    
    // MARK: Properties
    weak var view: CPTapBarViewProtocol?
    var interactor: CPTapBarInteractorInputProtocol?
    var router: CPTapBarRouterProtocol?
    
}

extension CPTapBarPresenter: CPTapBarPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.initUI()
    }
}

extension CPTapBarPresenter: CPTapBarInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
