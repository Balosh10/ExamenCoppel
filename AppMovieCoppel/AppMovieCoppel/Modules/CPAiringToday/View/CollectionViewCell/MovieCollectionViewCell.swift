//
//  MovieCollectionViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView! {
        didSet {
            movieImage.contentMode = .scaleToFill
            movieImage.viewShadow()
            movieImage.backgroundColor = .CPGray100
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
            lbInfo.font = CPFont.gothamBook.size(.large)
        }
    }
    @IBOutlet weak var lbDate: UILabel! {
        didSet {
            lbDate.textColor = UIColor.CPPrincipal
            lbDate.font = CPFont.gothamMedium.size(.large)
        }
    }
    @IBOutlet weak var lbStart: UILabel! {
        didSet {
            lbStart.textColor = UIColor.CPPrincipal
            lbStart.font = CPFont.gothamMedium.size(.large)
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
    
    var movie: CollectionMoviesModel? {
        didSet {
            //guard let url:URL = URL(string: APIService.shared.imageBase + (movie?.posterPath ?? ""))  else { return }
            //movieImage.load(url: url)
            movieImage.image = CPIcon.of(.logoMovie)!
            lbTitle.text = "Semd"
            lbInfo.text = "Semd"
            lbDate.text = "Semd"
            lbStart.text = "Semd"
            icStart.tintColorImg(image: CPIcon.of(.icStar)!, color: .CPPrincipal)
        }
    }
}
