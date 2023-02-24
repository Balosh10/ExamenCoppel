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

}

protocol CPTapBarRouterProtocol: AnyObject {
    // PRESENTER -> Router
    static func createCPTapBarModule() -> UIViewController
}

protocol CPTapBarPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CPTapBarViewProtocol? { get set }
    var interactor: CPTapBarInteractorInputProtocol? { get set }
    var router: CPTapBarRouterProtocol? { get set }
    
    func viewDidLoad()

}

protocol CPTapBarInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol CPTapBarInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CPTapBarInteractorOutputProtocol? { get set }
    var localDatamanager: CPTapBarLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CPTapBarRemoteDataManagerInputProtocol? { get set }
}

protocol CPTapBarDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CPTapBarRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CPTapBarRemoteDataManagerOutputProtocol? { get set }
}

protocol CPTapBarRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol CPTapBarLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
