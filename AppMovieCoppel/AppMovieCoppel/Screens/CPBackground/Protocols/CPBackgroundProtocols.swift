//
//  CPBackgroundProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

protocol CPBackgroundViewProtocol: AnyObject {
    var presenter: CPBackgroundPresenterProtocol? { get set }
    func initUI()
    func setupImageBackground()
    func gradientImageBackground()
    func showInfo(message: String)
}

protocol CPBackgroundRouterProtocol: AnyObject {
    static func createCPBackgroundModule(from dataBackground: CPDataBackground) -> UIViewController
    func presentDashboard(from view: CPBackgroundViewProtocol?)
    func presentLogin(from view: CPBackgroundViewProtocol?)
}

protocol CPBackgroundPresenterProtocol: AnyObject {
    var view: CPBackgroundViewProtocol? { get set }
    var interactor: CPBackgroundInteractorInputProtocol? { get set }
    var router: CPBackgroundRouterProtocol? { get set }
    
    func viewDidLoad()
    func presentLogin()
}

protocol CPBackgroundInteractorOutputProtocol: AnyObject {
    func presentDasboard()
    func presentLogin()
    func showInfo(message: String) 
}

protocol CPBackgroundInteractorInputProtocol: AnyObject {
    var presenter: CPBackgroundInteractorOutputProtocol? { get set }
    var dataBackground: CPDataBackground? { get set }
    
    func validateTheTypeOfAction()
    func validateCredentials()
    func logOutAction(message: String?)
}
