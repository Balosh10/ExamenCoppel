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
    var presenter: CPProfilePresenterProtocol? { get set }
    func initUI()
    func loadData(data: CPAccount)
    func loadDataMovie(data: CPMovies)
    func showError(message: String)
}

protocol CPProfileRouterProtocol: AnyObject {
    static func createCPProfileModule() -> UIViewController
    func presentBackground(from view: CPProfileViewProtocol?)
}

protocol CPProfilePresenterProtocol: AnyObject {
    var view: CPProfileViewProtocol? { get set }
    var interactor: CPProfileInteractorInputProtocol? { get set }
    var router: CPProfileRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPProfileInteractorOutputProtocol: AnyObject {
    func loadData(data: CPAccount)
    func loadDataMovie(data: CPMovies)
    func showError(message: String)
    func backgroundView(message: String)
}

protocol CPProfileInteractorInputProtocol: AnyObject {
    var presenter: CPProfileInteractorOutputProtocol? { get set }
    var remoteDatamanager: CPProfileRemoteDataManagerInputProtocol? { get set }
    func fechtAccount()
}

protocol CPProfileDataManagerInputProtocol: AnyObject {
}

protocol CPProfileRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPProfileRemoteDataManagerOutputProtocol? { get set }
    func fechtAccount()
}

protocol CPProfileRemoteDataManagerOutputProtocol: AnyObject {
    func loadData(data: CPAccount)
    func loadDataMovie(data: CPMovies)
    func showError(message: String)
    func backgroundView(message: String)
}
