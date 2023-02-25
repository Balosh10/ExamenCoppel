//
//  CPDashboardProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

protocol CPMovieViewProtocol: AnyObject {
    var presenter: CPMoviePresenterProtocol? { get set }
    func initUI()
    func loadData(movies: [CPCollectionMovies], type: CPList)
    func showError(message: String)
}

protocol CPMovieRouterProtocol: AnyObject {
    static func createCPMovieModule(dataMovie: CPMovieData) -> UIViewController
    func presentMovieDetail(from view: CPMovieViewProtocol?, movies: CPMovieDetail)
    func presentBackground(from view: CPMovieViewProtocol?)
}

protocol CPMoviePresenterProtocol: AnyObject {
    var view: CPMovieViewProtocol? { get set }
    var interactor: CPMovieInteractorInputProtocol? { get set }
    var router: CPMovieRouterProtocol? { get set }
    
    func viewDidLoad()
    func fetchMovieDetail(_ id: Int)
}

protocol CPMovieInteractorOutputProtocol: AnyObject {
    func showInfo(message: String)
    func loadData(movies: [CPCollectionMovies], type: CPList)
    func loadMovieDetail(movies: CPMovieDetail)
    func backgroundView(message: String)
}

protocol CPMovieInteractorInputProtocol: AnyObject {
    var presenter: CPMovieInteractorOutputProtocol? { get set }
    var remoteDatamanager: CPMovieRemoteDataManagerInputProtocol? { get set }
    var dataMovie: CPMovieData? { get set }
    
    func fechtMovie()
    func fetchMovieDetail(_ id: Int)
}

protocol CPMovieRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: CPMovieRemoteDataManagerOutputProtocol? { get set }
    
    func fechtMovie(_ list: CPList, _ result: CPResult)
    func fetchMovieDetail(_ list: CPList, _ id: Int)
}

protocol CPMovieRemoteDataManagerOutputProtocol: AnyObject {
    func loadData(movies: CPMovies)
    func loadMovieDetail(movies: CPMovieDetail)
    func backgroundView(message: String)
    func showError(message: String)
}

