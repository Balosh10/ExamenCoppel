//
//  CPProfileMoviewFavoriteView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import UIKit

internal class CPProfileMoviewFavoriteView: UIView {
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.text = "Favorite Shows"
        lbTitle.textColor = UIColor.CPPrincipal
        lbTitle.font = CPFont.gothamMedium.size(.title)
        return lbTitle
    }()
    private lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var movieCollectioView: UICollectionView?
    private var cellCollectionViewIdentifier = "MovieCollectionViewCell"
    private var collectiondataSource: CPCollectionViewDataSource<MovieCollectionViewCell, CollectionMoviesModel>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        addSubview(lbTitle)
        addSubview(contentView)
        NSLayoutConstraint.activate([
            lbTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lbTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbTitle.heightAnchor.constraint(equalToConstant: 44),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentView.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let size = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 300)
        flowLayout.itemSize = size
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        movieCollectioView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        movieCollectioView?.collectionViewLayout = flowLayout
        movieCollectioView?.showsHorizontalScrollIndicator = false
        movieCollectioView?.translatesAutoresizingMaskIntoConstraints = false
        movieCollectioView?.backgroundColor = .clear
        guard let collection = movieCollectioView else {
            return
        }
        contentView.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        loadData()
    }
    func loadData() {
        var moview = MoviesModel()
        moview.title = "hdd"
        var dd = CollectionMoviesModel()
        dd.title = "aa"
        dd.type = "aaasdd"
        moview.results = [dd, dd, dd, dd, dd, dd, dd, dd, dd, dd, dd]
        moview.type = "sss"
        updateCellWith(row: moview.results)
    }
    var collectionViewOffset: CGFloat {
        set { movieCollectioView?.contentOffset.x = newValue }
        get { return movieCollectioView?.contentOffset.x ?? 0}
    }
    func updateCellWith(row: [CollectionMoviesModel]?) {
        self.collectiondataSource = CPCollectionViewDataSource(cellIdentifier: cellCollectionViewIdentifier,
                                                                  items: row,
                                                                  configureCell: { (cellCollection, itemMovie) in
            //cellCollection.movieImage.setRadiusProfile()
            cellCollection.movie = itemMovie
            /*let posterPathDesencryp =  EncryptionTool.share.decrypString(string64: (itemMovie?.posterPath ?? ""))  ?? ""
             guard let url:URL = URL(string: APIService.shared.imageBase + posterPathDesencryp)  else { return }
             cellCollection.movieImage.load(url: url)*/
            
        })
        
        /*self.collectionDelegate = MovieCollectionViewDelegate(cellIdentifier: cellCollectionViewIdentifier,
                                                              items: row,
                                                              configureCell: { (cellCollection, itemMovie) in
            //self.cellDelegate?.collectionView(collectionviewcell: cellCollection,
              //                                selectMovie: itemMovie,
                //                              didTappedInTableViewCell: self)
        })*/
        
        DispatchQueue.main.async {
            //self.movieCollectioView?.delegate = self.collectionDelegate
            self.movieCollectioView?.dataSource = self.collectiondataSource
            self.movieCollectioView?.register(UINib(nibName: self.cellCollectionViewIdentifier, bundle: nil),
                                              forCellWithReuseIdentifier: self.cellCollectionViewIdentifier)
            self.movieCollectioView?.reloadData()
        }
    }

}
