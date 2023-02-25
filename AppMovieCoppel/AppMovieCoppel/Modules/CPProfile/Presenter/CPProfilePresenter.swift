//
//  CPProfilePresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation

class CPProfilePresenter  {
    
    // MARK: Properties
    weak var view: CPProfileViewProtocol?
    var interactor: CPProfileInteractorInputProtocol?
    var router: CPProfileRouterProtocol?
    
}

extension CPProfilePresenter: CPProfilePresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        CPLoader.show()
        interactor?.fechtAccount()
    }
}

extension CPProfilePresenter: CPProfileInteractorOutputProtocol {
    func loadData(data: CPAccount) {
        CPLoader.hide()
        view?.loadData(data: data)
    }
    func loadDataMovie(data: CPMovies) {
        view?.loadDataMovie(data: data)
    }
    func showError(message: String) {
        CPLoader.hide()
        view?.showError(message: message)
    }
    func backgroundView(message: String) {
        router?.presentBackground(from: view, message: message)
    }
}
