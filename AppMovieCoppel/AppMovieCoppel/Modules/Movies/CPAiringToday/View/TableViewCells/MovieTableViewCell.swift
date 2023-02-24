//
//  MovieTableViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

/*protocol MovieCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: MovieCollectionViewCell?,
                        selectMovie: CollectionMoviesModel?,
                        didTappedInTableViewCell: MovieTableViewCell)
    // other delegate methods that you can define to perform action in viewcontroller
}*/

class MovieTableViewCell: UITableViewCell {
    
    private var movieCollectioViewCell: UICollectionView?
    static var cellCollectionViewIdentifier = "MovieCollectionViewCell"
    private var collectiondataSource : MovieCollectionViewDataSource<MovieCollectionViewCell, CollectionMoviesModel>!
    private var collectionDelegate : MovieCollectionViewDelegate<MovieCollectionViewCell, CollectionMoviesModel>!
   // weak var cellDelegate: MovieCollectionViewCellDelegate?
    
    var movie: SubCategoryModel? {
        didSet {
            // movieNameLabel.text = movie?.title ?? ""
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: 200, height: 300)
        flowLayout.minimumLineSpacing = 6
        flowLayout.minimumInteritemSpacing = 16
        movieCollectioViewCell = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        movieCollectioViewCell?.collectionViewLayout = flowLayout
        movieCollectioViewCell?.showsHorizontalScrollIndicator = false
        movieCollectioViewCell?.translatesAutoresizingMaskIntoConstraints = false
        movieCollectioViewCell?.backgroundColor = .clear
        guard let collection = movieCollectioViewCell else {
            return
        }
        contentView.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}

extension MovieTableViewCell {
    
    var collectionViewOffset: CGFloat {
        set { movieCollectioViewCell?.contentOffset.x = newValue }
        get { return movieCollectioViewCell?.contentOffset.x ?? 0}
    }
    
    func updateCellWith(row: [CollectionMoviesModel]?) {
        self.collectiondataSource = MovieCollectionViewDataSource(cellIdentifier: MovieTableViewCell.cellCollectionViewIdentifier,
                                                                  items: row,
                                                                  configureCell: { (cellCollection, itemMovie) in
            //cellCollection.movieImage.setRadiusProfile()
            cellCollection.movie = itemMovie
            /*let posterPathDesencryp =  EncryptionTool.share.decrypString(string64: (itemMovie?.posterPath ?? ""))  ?? ""
             guard let url:URL = URL(string: APIService.shared.imageBase + posterPathDesencryp)  else { return }
             cellCollection.movieImage.load(url: url)*/
            
        })
        
        self.collectionDelegate = MovieCollectionViewDelegate(cellIdentifier: MovieTableViewCell.cellCollectionViewIdentifier,
                                                              items: row,
                                                              configureCell: { (cellCollection, itemMovie) in
           /* self.cellDelegate?.collectionView(collectionviewcell: cellCollection,
                                              selectMovie: itemMovie,
                                              didTappedInTableViewCell: self)*/
        })
        
        
        DispatchQueue.main.async {
            self.movieCollectioViewCell?.delegate = self.collectionDelegate
            self.movieCollectioViewCell?.dataSource = self.collectiondataSource
            self.movieCollectioViewCell?.register(UINib(nibName: MovieTableViewCell.cellCollectionViewIdentifier, bundle: nil),
                                                 forCellWithReuseIdentifier: MovieTableViewCell.cellCollectionViewIdentifier)
            self.movieCollectioViewCell?.reloadData()
        }
    }
}
