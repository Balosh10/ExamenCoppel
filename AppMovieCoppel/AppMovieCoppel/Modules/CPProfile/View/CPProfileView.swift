//
//  CPProfileView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

class CPProfileView: UIViewController {

    private lazy var contentView: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    private lazy var profileView: CPProfileDataView = {
        var profileView = CPProfileDataView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    private lazy var movieView: CPProfileMoviewFavoriteView = {
        var movieView = CPProfileMoviewFavoriteView()
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.backgroundColor = .clear
        return movieView
    }()
    
    // MARK: Properties
    var presenter: CPProfilePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CPProfileView: CPProfileViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
        statusBarView(color: UIColor.clear)
        setupScrollView()
        contentViews()
        contentProfileView()
    }
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.bringSubviewToFront(scrollView)
        scrollView.addSubview(contentView)
        scrollView.bringSubviewToFront(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    func contentViews() {
        [profileView, movieView].forEach({ contentView.addSubview($0)})
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            profileView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 200),
            movieView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            movieView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 44),
            movieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            movieView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
    func contentProfileView() {
        [profileView, movieView].forEach({ contentView.addSubview($0)})
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            profileView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 400),
            movieView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            movieView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 44),
            movieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            movieView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
    
    func loadData(data: CPAccount) {
        profileView.loadData(item: data)
    }
    func loadDataMovie(data: CPMovies) {
        movieView.loadData(movies: data.results, type: .movie)
    }
    func showError(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
