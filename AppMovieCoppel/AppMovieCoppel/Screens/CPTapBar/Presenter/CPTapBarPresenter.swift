//
//  CPTapBarPresenter.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation

class CPTapBarPresenter  {
    
    // MARK: Properties
    weak var view: CPTapBarViewProtocol?
    var interactor: CPTapBarInteractorInputProtocol?
    var router: CPTapBarRouterProtocol?
    
}

extension CPTapBarPresenter: CPTapBarPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
    }
    func selecTap(type: CPTypeSheet) {
        switch type {
            case .viewProfile:
                router?.presentProfile(from: view)
            case .logOut:
                CPLoader.show()
                interactor?.logOut()
        }
    }
    func selectionDidChange(type: CPTaps) {
        let data = getMovieParameters(type: type)
        router?.presentMovies(from: view, dataMovie: data)
    }
}

extension CPTapBarPresenter: CPTapBarInteractorOutputProtocol {
    func presentLogin() {
        CPLoader.hide()
        router?.presentLogin(from: view)
    }
    func showInfo(message: String) {
        view?.showInfo(message: message)
    }
    func backgroundView(message: String) {
        router?.presentBackground(from: view, message: message)
    }
}

extension CPTapBarPresenter {
    func getMovieParameters(type: CPTaps) -> CPMovieData {
        var data: CPMovieData = CPMovieData()
        switch type {
            case .airingToday:
                data.result = .airing_today
                data.list = .tv
            case .onTV:
                data.result = .on_the_air
                data.list = .tv
            case .topRated:
                data.result = .top_rated
                data.list = .movie
            case .popular:
                data.result = .popular
                data.list = .movie
        }
        return data
    }
}
