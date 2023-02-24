//
//  MovieTableViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

protocol MovieCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: MovieCollectionViewCell?,
                        selectMovie: CollectionMoviesModel?,
                        didTappedInTableViewCell: MovieTableViewCell)
    // other delegate methods that you can define to perform action in viewcontroller
}

class MovieTableViewCell: UITableViewCell {

    private lazy var movieCollectioViewCell: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private lazy var viewContent: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    static var cellCollectionViewIdentifier = "MovieCollectionViewCell"
    
    private var collectiondataSource : MovieCollectionViewDataSource<MovieCollectionViewCell, CollectionMoviesModel>!
    private var collectionDelegate : MovieCollectionViewDelegate<MovieCollectionViewCell, CollectionMoviesModel>!
    weak var cellDelegate: MovieCollectionViewCellDelegate?

    var movie : SubCategoryModel? {
        didSet {
           // movieNameLabel.text = movie?.title ?? ""
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(viewContent)
        viewContent.addSubview(movieCollectioViewCell)
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            movieCollectioViewCell.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 0),
            movieCollectioViewCell.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 0),
            movieCollectioViewCell.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: 0),
            movieCollectioViewCell.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: 0)
        
        ])
        // TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: 80, height: 100)
        flowLayout.minimumLineSpacing = 6
        flowLayout.minimumInteritemSpacing = 16
        self.movieCollectioViewCell.collectionViewLayout = flowLayout
        self.movieCollectioViewCell.showsHorizontalScrollIndicator = false
        self.movieCollectioViewCell.register(UINib(nibName: MovieTableViewCell.cellCollectionViewIdentifier, bundle: .main),
                                             forCellWithReuseIdentifier: MovieTableViewCell.cellCollectionViewIdentifier)
    }
}

extension MovieTableViewCell {
    
    var collectionViewOffset: CGFloat {
        set { movieCollectioViewCell.contentOffset.x = newValue }
        get { return movieCollectioViewCell.contentOffset.x }
    }
    
    func updateCellWith(row: [CollectionMoviesModel]?) {
        self.collectiondataSource = MovieCollectionViewDataSource(cellIdentifier: MovieTableViewCell.cellCollectionViewIdentifier,
                                                                  items: row,
                                                                  configureCell: { (cellCollection, itemMovie) in
            //cellCollection.movieImage.setRadiusProfile()
            cellCollection.movieImage.contentMode = .scaleToFill
            /*let posterPathDesencryp =  EncryptionTool.share.decrypString(string64: (itemMovie?.posterPath ?? ""))  ?? ""
            guard let url:URL = URL(string: APIService.shared.imageBase + posterPathDesencryp)  else { return }
            cellCollection.movieImage.load(url: url)*/

        })
        
        self.collectionDelegate = MovieCollectionViewDelegate(cellIdentifier: MovieTableViewCell.cellCollectionViewIdentifier,
                                                              items: row,
                                                              configureCell: { (cellCollection, itemMovie) in
            self.cellDelegate?.collectionView(collectionviewcell: cellCollection,
                                              selectMovie: itemMovie,
                                              didTappedInTableViewCell: self)
        })
        
        self.movieCollectioViewCell.delegate = self.collectionDelegate
        self.movieCollectioViewCell.dataSource = self.collectiondataSource
        self.movieCollectioViewCell.reloadData()
    }
}
