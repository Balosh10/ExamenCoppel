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
    var presenter: CPAiringTodayPresenterProtocol? { get set }
    func initUI()
    func loadData(movies: [CPCollectionMovies], type: CPList)
    func showError(message: String)
}

protocol CPAiringTodayRouterProtocol: AnyObject {
    static func createCPAiringTodayModule(dataMovie: CPMovieData) -> UIViewController
    func presentMovieDetail(from view: CPAiringTodayViewProtocol?, movies: CPMovieDetail)
}

protocol CPAiringTodayPresenterProtocol: AnyObject {
    var view: CPAiringTodayViewProtocol? { get set }
    var interactor: CPAiringTodayInteractorInputProtocol? { get set }
    var router: CPAiringTodayRouterProtocol? { get set }
    
    func viewDidLoad()
    func fetchMovieDetail(_ id: Int)
}

protocol CPAiringTodayInteractorOutputProtocol: AnyObject {
    func showInfo(message: String)
    func loadData(movies: [CPCollectionMovies], type: CPList)
    func loadMovieDetail(movies: CPMovieDetail)
}

protocol CPAiringTodayInteractorInputProtocol: AnyObject {
    var presenter: CPAiringTodayInteractorOutputProtocol? { get set }
    var remoteDatamanager: CPAiringTodayRemoteDataManagerInputProtocol? { get set }
    var dataMovie: CPMovieData? { get set }
    
    func fechtMovie()
    func fetchMovieDetail(_ id: Int)
}

protocol CPAiringTodayRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPDashboardRemoteDataManagerOutputProtocol? { get set }
    
    func fechtMovie(_ list: CPList, _ result: CPResult)
    func fetchMovieDetail(_ list: CPList, _ id: Int)
}

protocol CPDashboardRemoteDataManagerOutputProtocol: AnyObject {
    func loadData(movies: CPMovies)
    func loadMovieDetail(movies: CPMovieDetail)
    func showError(message: String)
}

