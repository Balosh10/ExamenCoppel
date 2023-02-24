//
//  MovieCollectionViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    var movie : CollectionMoviesModel? {
        didSet {
            //guard let url:URL = URL(string: APIService.shared.imageBase + (movie?.posterPath ?? ""))  else { return }
            //movieImage.load(url: url)
        }
    }
}
