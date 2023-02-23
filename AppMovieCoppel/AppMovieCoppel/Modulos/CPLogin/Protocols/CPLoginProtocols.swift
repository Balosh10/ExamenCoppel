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
}

protocol CPLoginRouterProtocol: AnyObject {
    static func createCPLoginModule() -> UIViewController
}

protocol CPLoginPresenterProtocol: AnyObject {
    var view: CPLoginViewProtocol? { get set }
    var interactor: CPLoginInteractorInputProtocol? { get set }
    var router: CPLoginRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPLoginInteractorOutputProtocol: AnyObject {
}

protocol CPLoginInteractorInputProtocol: AnyObject {
    var presenter: CPLoginInteractorOutputProtocol? { get set }
    var localDatamanager: CPLoginLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CPLoginRemoteDataManagerInputProtocol? { get set }
}

protocol CPLoginDataManagerInputProtocol: AnyObject {
}

protocol CPLoginRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPLoginRemoteDataManagerOutputProtocol? { get set }
}

protocol CPLoginRemoteDataManagerOutputProtocol: AnyObject {
}

protocol CPLoginLocalDataManagerInputProtocol: AnyObject {
}
