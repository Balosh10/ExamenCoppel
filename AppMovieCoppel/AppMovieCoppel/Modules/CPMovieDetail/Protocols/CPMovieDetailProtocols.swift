//
//  CPMovieDetailProtocols.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

protocol CPMovieDetailViewProtocol: AnyObject {
    var presenter: CPMovieDetailPresenterProtocol? { get set }
    func initUI()
    func loadInfoMovie(item: CPMovieDetail)
}

protocol CPMovieDetailRouterProtocol: AnyObject {
    static func createCPMovieDetailModule(_ movies: CPMovieDetail) -> UIViewController
}

protocol CPMovieDetailPresenterProtocol: AnyObject {
    var view: CPMovieDetailViewProtocol? { get set }
    var interactor: CPMovieDetailInteractorInputProtocol? { get set }
    var router: CPMovieDetailRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPMovieDetailInteractorOutputProtocol: AnyObject {
    func loadInfoMovie(item: CPMovieDetail)
}

protocol CPMovieDetailInteractorInputProtocol: AnyObject {
    var presenter: CPMovieDetailInteractorOutputProtocol? { get set }
    var movies: CPMovieDetail? { get set }
    func getMovieData()
}
