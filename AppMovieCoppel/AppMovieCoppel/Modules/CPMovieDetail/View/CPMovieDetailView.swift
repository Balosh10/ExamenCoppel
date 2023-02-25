//
//  CPMovieDetailView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//  
//

import Foundation
import UIKit

internal class CPMovieDetailView: UIViewController {

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
    private lazy var movieImageView: CPMovieImageView = {
        var movieDescriptionView = CPMovieImageView()
        movieDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionView.backgroundColor = .clear
        movieDescriptionView.contentMode = .scaleToFill
        return movieDescriptionView
    }()
    
    private lazy var productionCompaniesView: CPProductionCompaniesView = {
        var contentView = CPProductionCompaniesView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        return contentView
    }()
    private lazy var lbOverview: UILabel = {
        var lbOverview = UILabel()
        lbOverview.translatesAutoresizingMaskIntoConstraints = false
        lbOverview.numberOfLines = 0
        lbOverview.textColor = UIColor.CPWhite100
        lbOverview.font = CPFont.gothamBook.size(.smail)
        return lbOverview
    }()
    private lazy var btnBack: UIButton = {
        var btnBack = UIButton()
        let iconBack = UIImage(systemName: "arrow.backward")?.withTintColor(.CPWhite100, renderingMode: .alwaysOriginal)
        btnBack.setImage(iconBack, for: .normal)
        btnBack.radiusView(radius: 22, .CPPrincipal)
        btnBack.backgroundColor = .CPPrincipal.withAlphaComponent(0.5)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        return btnBack
    }()
    // MARK: Properties
    var presenter: CPMovieDetailPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CPMovieDetailView: CPMovieDetailViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
        statusBarView(color: UIColor.clear)
        setupScrollView()
        contentViews()
    }
    func setupScrollView() {
        [btnBack, scrollView].forEach({ view.addSubview($0)})
        view.bringSubviewToFront(btnBack)
        scrollView.bringSubviewToFront(scrollView)
        scrollView.addSubview(contentView)
        scrollView.bringSubviewToFront(contentView)
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            btnBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            btnBack.heightAnchor.constraint(equalToConstant: 44),
            btnBack.widthAnchor.constraint(equalToConstant: 44),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        btnBack.addTapGesture { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    func contentViews() {
        [movieImageView, lbOverview, productionCompaniesView].forEach({ contentView.addSubview($0)})
        contentView.bringSubviewToFront(btnBack)
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 400),
            
            lbOverview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lbOverview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            lbOverview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            lbOverview.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 24),
            lbOverview.bottomAnchor.constraint(equalTo: productionCompaniesView.topAnchor, constant: -44),
            
            productionCompaniesView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productionCompaniesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productionCompaniesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productionCompaniesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            productionCompaniesView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func loadInfoMovie(movieDatailData: CPMovieDetailData) {
        movieImageView.loadInfoMovie(movieDatailData: movieDatailData)
        var date: Date = Date()
        let info = NSMutableAttributedString()
        switch movieDatailData.type {
            case .movie:
                if let releaseDate = movieDatailData.movie.releaseDate,
                   let release = releaseDate.formatter(.yyyyMMdd) {
                    date = release
                }
            case .tv:
                if let firstAirDate = movieDatailData.movie.firstAirDate,
                   let release = firstAirDate.formatter(.yyyyMMdd) {
                    date = release
                }
        }
        info.append(NSMutableAttributedString().boldText(date.formatter(.ddMMMyyyy)?.capitalized ?? "",
                                                         .CPPrincipal,
                                                         .left,
                                                         .medium))
        if let overview = movieDatailData.movie.overview {
            info.append(NSMutableAttributedString().normalText("\n\n\(overview)",
                                                               .CPWhite100,
                                                               .left,
                                                               .medium))
        }
        lbOverview.attributedText = info
        productionCompaniesView.loadData(movies: movieDatailData.movie.productionCompanies)
    }
    
}
