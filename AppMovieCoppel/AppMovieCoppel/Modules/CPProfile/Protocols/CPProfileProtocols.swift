//
//  CPProfileProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

protocol CPProfileViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CPProfilePresenterProtocol? { get set }
    func initUI()
}

protocol CPProfileRouterProtocol: AnyObject {
    // PRESENTER -> Router
    static func createCPProfileModule() -> UIViewController
}

protocol CPProfilePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CPProfileViewProtocol? { get set }
    var interactor: CPProfileInteractorInputProtocol? { get set }
    var router: CPProfileRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPProfileInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol CPProfileInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CPProfileInteractorOutputProtocol? { get set }
    var localDatamanager: CPProfileLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CPProfileRemoteDataManagerInputProtocol? { get set }
}

protocol CPProfileDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CPProfileRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CPProfileRemoteDataManagerOutputProtocol? { get set }
}

protocol CPProfileRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol CPProfileLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
