//
//  CPDashboardView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPAiringTodayView: UIViewController {

    // MARK: Properties
    var presenter: CPAiringTodayPresenterProtocol?
    private var movieCollectioView: UICollectionView?
    private var cellCollectionViewIdentifier = "MovieCollectionViewCell"
    private var collectiondataSource: CPCollectionViewDataSource<MovieCollectionViewCell, CollectionMoviesModel>!
    //private var collectionDelegate: CPCollectionViewDelegate<MovieCollectionViewCell, CollectionMoviesModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
}

extension CPAiringTodayView: CPAiringTodayViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let size = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 250)
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
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
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
