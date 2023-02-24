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
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.initUI()
    }
}

extension CPProfilePresenter: CPProfileInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
