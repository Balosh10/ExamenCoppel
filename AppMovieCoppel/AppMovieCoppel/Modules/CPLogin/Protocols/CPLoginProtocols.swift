//
//  CPLoginProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation
import UIKit

protocol CPLoginViewProtocol: AnyObject {
    var presenter: CPLoginPresenterProtocol? { get set }
    
    func initUI()
    func setupImageBackground()
    func setupScrollView()
    func gradientImageBackground()
    func showError(text: String)
}

protocol CPLoginRouterProtocol: AnyObject {
    static func createCPLoginModule() -> UIViewController
    func presentDashboard(from view: CPLoginViewProtocol?)
}

protocol CPLoginPresenterProtocol: AnyObject {
    var view: CPLoginViewProtocol? { get set }
    var interactor: CPLoginInteractorInputProtocol? { get set }
    var router: CPLoginRouterProtocol? { get set }
    
    func viewDidLoad()
    func logIn(_ name: String, _ password: String)
}

protocol CPLoginInteractorOutputProtocol: AnyObject {
    func showInfo(message: String)
    func presentDashboard()
}

protocol CPLoginInteractorInputProtocol: AnyObject {
    var presenter: CPLoginInteractorOutputProtocol? { get set }
    var remoteDatamanager: CPLoginRemoteDataManagerInputProtocol? { get set }

    func logIn(_ name: String, _ password: String)

}
protocol CPLoginRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPLoginRemoteDataManagerOutputProtocol? { get set }
    func logIn(_ name: String, _ password: String)
    func createRequestToken()
    func createSesionWithLogin()
    func createGuestSessionNew()
}

protocol CPLoginRemoteDataManagerOutputProtocol: AnyObject {
    func showInfo(message: String)
    func presentDashboard()
}
