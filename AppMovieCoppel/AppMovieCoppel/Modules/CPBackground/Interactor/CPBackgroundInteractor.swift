//
//  CPBackgroundInteractor.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPBackgroundInteractor: CPBackgroundInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: CPBackgroundInteractorOutputProtocol?
    var dataBackground: CPDataBackground?
    func validCredencialUser() {
        guard let data = dataBackground else  {
            return
        }
        switch data.type {
            case .background:
                let sessionId = CPSession.shared.getStringValue(.sessionId)
                let requestToken = CPSession.shared.getStringValue(.requestToken)
                if !sessionId.isEmpty && !requestToken.isEmpty {
                    presenter?.presentDasboard()
                } else {
                    presenter?.presentLogin()
                }
            case .logOut:
                CPSession.shared.singOut()
                presenter?.showInfo(message: data.message ?? Localizable.text(.authenticationFailed))
        }
    }
}
