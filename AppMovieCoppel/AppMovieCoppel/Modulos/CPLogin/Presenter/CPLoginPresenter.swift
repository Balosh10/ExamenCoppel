//
//  CPLoginPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation

class CPLoginPresenter  {
    
    // MARK: Properties
    weak var view: CPLoginViewProtocol?
    var interactor: CPLoginInteractorInputProtocol?
    var router: CPLoginRouterProtocol?
    
}

extension CPLoginPresenter: CPLoginPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
    }
}

extension CPLoginPresenter: CPLoginInteractorOutputProtocol {
}
