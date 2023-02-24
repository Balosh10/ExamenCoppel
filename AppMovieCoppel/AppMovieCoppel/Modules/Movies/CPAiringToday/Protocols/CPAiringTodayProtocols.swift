//
//  CPDashboardProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

protocol CPAiringTodayViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: CPAiringTodayPresenterProtocol? { get set }
    func initUI()
    func loadData()
}

protocol CPAiringTodayRouterProtocol: AnyObject {
    // PRESENTER -> Router
    static func createCPAiringTodayModule() -> UIViewController
}

protocol CPAiringTodayPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: CPAiringTodayViewProtocol? { get set }
    var interactor: CPAiringTodayInteractorInputProtocol? { get set }
    var router: CPAiringTodayRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPAiringTodayInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol CPAiringTodayInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: CPAiringTodayInteractorOutputProtocol? { get set }
    var localDatamanager: CPAiringTodayLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CPAiringTodayRemoteDataManagerInputProtocol? { get set }
}

protocol CPDashboardDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol CPAiringTodayRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: CPDashboardRemoteDataManagerOutputProtocol? { get set }
}

protocol CPDashboardRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol CPAiringTodayLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
