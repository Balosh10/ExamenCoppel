//
//  MovieCollectionViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: CPRoundedImageView! {
        didSet {
            movieImage.contentMode = .scaleToFill
            movieImage.backgroundColor = .CPBase200
        }
    }
    @IBOutlet weak var lbTitle: UILabel! {
        didSet {
            lbTitle.textColor = UIColor.CPPrincipal
            lbTitle.font = CPFont.gothamMedium.size(.large)
        }
    }
    @IBOutlet weak var lbInfo: UILabel! {
        didSet {
            lbInfo.textColor = UIColor.CPWhite100
            lbInfo.font = CPFont.gothamBook.size(.smail)
        }
    }
    @IBOutlet weak var lbDate: UILabel! {
        didSet {
            lbDate.textColor = UIColor.CPPrincipal
            lbDate.font = CPFont.gothamMedium.size(.smail)
        }
    }
    @IBOutlet weak var lbStart: UILabel! {
        didSet {
            lbStart.textColor = UIColor.CPPrincipal
            lbStart.font = CPFont.gothamMedium.size(.smail)
        }
    }
    @IBOutlet weak var icStart: UIImageView! {
        didSet {
            icStart.tintColorImg(image: CPIcon.of(.icStar)!, color: .CPGray100)
        }
    }
    @IBOutlet weak var viewContent: UIView! {
        didSet {
            viewContent.viewShadow()
            viewContent.backgroundColor = .CPBase200
        }
    }
    
    func loadView(movie: CPCollectionMovies, type: CPList) {
        movieImage.setTopCornerRadius(rect: CGRect(x: 0,
                                                   y: 0,
                                                   width: contentView.frame.width,
                                                   height: 150))
        lbInfo.text = movie.overview
        lbStart.text = String(movie.voteCount ?? 0)
        icStart.tintColorImg(image: CPIcon.of(.icStar)!, color: .CPPrincipal)
        switch type {
            case .movie:
                lbTitle.text = movie.title
                if let releaseDate = movie.releaseDate,
                   let release = releaseDate.formatter(.yyyyMMdd) {
                    lbDate.text = release.formatter(.ddMMMyyyy)?.capitalized ?? ""
                }
            case .tv:
                lbTitle.text = movie.name
                if let releaseDate = movie.firstAirDate,
                   let release = releaseDate.formatter(.yyyyMMdd) {
                    lbDate.text = release.formatter(.ddMMMyyyy)?.capitalized ?? ""
                }
        }
        guard let url:URL = URL(string: Setting.imageBase + (movie.posterPath ?? "")) else { return }
        movieImage.load(url: url)
    }
}
