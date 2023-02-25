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
    var presenter: CPTapBarPresenterProtocol? { get set }
    func initUI()
    func showInfo(message: String)
}

protocol CPTapBarRouterProtocol: AnyObject {
    static func createCPTapBarModule() -> UIViewController
    func presentLogin(from view: CPTapBarViewProtocol?)
    func presentProfile(from view: CPTapBarViewProtocol?)
    func presentMovies(from view: CPTapBarViewProtocol?, dataMovie: CPMovieData)
    func presentBackground(from view: CPTapBarViewProtocol?, message: String)
}

protocol CPTapBarPresenterProtocol: AnyObject {
    var view: CPTapBarViewProtocol? { get set }
    var interactor: CPTapBarInteractorInputProtocol? { get set }
    var router: CPTapBarRouterProtocol? { get set }
    
    func viewDidLoad()
    func selecTap(type: CPTypeSheet)
    func selectionDidChange(type: CPTaps)
}

protocol CPTapBarInteractorOutputProtocol: AnyObject {
    func showInfo(message: String)
    func presentLogin()
    func backgroundView(message: String)
}

protocol CPTapBarInteractorInputProtocol: AnyObject {
    var presenter: CPTapBarInteractorOutputProtocol? { get set }
    var remoteDatamanager: CPTapBarRemoteDataManagerInputProtocol? { get set }
    func logOut()
}

protocol CPTapBarRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPTapBarRemoteDataManagerOutputProtocol? { get set }
    func logOut()
}

protocol CPTapBarRemoteDataManagerOutputProtocol: AnyObject {
    func showInfo(message: String)
    func backgroundView(message: String)
    func presentLogin()
}
