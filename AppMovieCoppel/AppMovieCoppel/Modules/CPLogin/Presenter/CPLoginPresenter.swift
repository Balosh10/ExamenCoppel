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
    func logIn(_ name: String, _ password: String) {
        interactor?.logIn(name, password)
    }
}

extension CPLoginPresenter: CPLoginInteractorOutputProtocol {
    func showInfo(message: String) {
        view?.showError(text: message)
    }
}
