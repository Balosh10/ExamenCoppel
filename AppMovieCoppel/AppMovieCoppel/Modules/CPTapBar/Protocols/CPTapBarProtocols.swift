//
//  CPTapBarProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

protocol CPTapBarViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CPTapBarPresenterProtocol? { get set }
    func initUI()
    func showInfo(message: String)
}

protocol CPTapBarRouterProtocol: AnyObject {
    // PRESENTER -> Router
    static func createCPTapBarModule() -> UIViewController
    func presentLogin(from view: CPTapBarViewProtocol?)
    func presentProfile(from view: CPTapBarViewProtocol?)
    func presentMovies(from view: CPTapBarViewProtocol?, dataMovie: CPMovieData)
}

protocol CPTapBarPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CPTapBarViewProtocol? { get set }
    var interactor: CPTapBarInteractorInputProtocol? { get set }
    var router: CPTapBarRouterProtocol? { get set }
    
    func viewDidLoad()
    func selecTap(type: CPTypeSheet)
    func selectionDidChange(type: CPTaps)
}

protocol CPTapBarInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func showInfo(message: String)
    func presentLogin()
}

protocol CPTapBarInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CPTapBarInteractorOutputProtocol? { get set }
    var localDatamanager: CPTapBarLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CPTapBarRemoteDataManagerInputProtocol? { get set }
    func logOut()
}

protocol CPTapBarDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CPTapBarRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CPTapBarRemoteDataManagerOutputProtocol? { get set }
    func logOut()
}

protocol CPTapBarRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func showInfo(message: String)
    func presentLogin()
}

protocol CPTapBarLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
