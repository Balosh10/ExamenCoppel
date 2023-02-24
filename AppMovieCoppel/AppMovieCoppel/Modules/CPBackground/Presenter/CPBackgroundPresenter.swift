//
//  CPBackgroundPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPBackgroundPresenter  {
    
    // MARK: Properties
    weak var view: CPBackgroundViewProtocol?
    var interactor: CPBackgroundInteractorInputProtocol?
    var router: CPBackgroundRouterProtocol?
    
}

extension CPBackgroundPresenter: CPBackgroundPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.validCredencial()
    }
}

extension CPBackgroundPresenter: CPBackgroundInteractorOutputProtocol {
    func presentDasboard() {
        CPLoader.hide()
        router?.presentDashboard(from: view)
    }
    func presentLogin() {
        CPLoader.hide()
        router?.presentLogin(from: view)
    }
}
