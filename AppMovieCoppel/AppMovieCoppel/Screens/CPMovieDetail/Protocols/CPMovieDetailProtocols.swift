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
    func loadInfoMovie(movieDatailData: CPMovieDetailData)
}

protocol CPMovieDetailRouterProtocol: AnyObject {
    static func createCPMovieDetailModule(_ movieDatailData: CPMovieDetailData) -> UIViewController
}

protocol CPMovieDetailPresenterProtocol: AnyObject {
    var view: CPMovieDetailViewProtocol? { get set }
    var interactor: CPMovieDetailInteractorInputProtocol? { get set }
    var router: CPMovieDetailRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CPMovieDetailInteractorOutputProtocol: AnyObject {
    func loadInfoMovie(movieDatailData: CPMovieDetailData)
}

protocol CPMovieDetailInteractorInputProtocol: AnyObject {
    var presenter: CPMovieDetailInteractorOutputProtocol? { get set }
    var movieDatailData: CPMovieDetailData? { get set }
    func getMovieData()
}
