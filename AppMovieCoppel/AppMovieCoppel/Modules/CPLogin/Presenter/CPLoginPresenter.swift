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
        CPLoader.show()
        interactor?.logIn(name, password)
    }
}

extension CPLoginPresenter: CPLoginInteractorOutputProtocol {
    func showInfo(message: String) {
        CPLoader.hide()
        view?.showError(text: message)
    }
    func presentDashboard() {
        CPLoader.hide()
        router?.presentDashboard(from: view)
    }
}
