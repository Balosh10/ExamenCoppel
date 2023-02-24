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
    //private var tableDataSource: MovieTableViewDataSource<MovieTableViewCell, SubCategoryModel>!
    //private var tableDelegate: MovieTableViewDelegate<MovieHeaderTableViewCell, SubCategoryModel>!
   // private var cellIdentifier = "movieTableViewCell"
    //private var headerCellIdentifier = "movieHeaderTableViewCell"
    // MARK: Lifecycle
    private var movieCollectioView: UICollectionView?
    private var cellCollectionViewIdentifier = "MovieCollectionViewCell"
    private var collectiondataSource : MovieCollectionViewDataSource<MovieCollectionViewCell, CollectionMoviesModel>!
    private var collectionDelegate : MovieCollectionViewDelegate<MovieCollectionViewCell, CollectionMoviesModel>!
    //weak var cellDelegate: MovieCollectionViewCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
}

extension CPAiringTodayView: CPAiringTodayViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
       /*// self.tableView.delegate = self.tableDelegate
        tableView.dataSource = self.tableDataSource
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        //self.tableView.register(MovieHeaderTableViewCell.self, forCellReuseIdentifier: self.headerCellIdentifier)
        tableView.backgroundColor = .CPBase100
        tableView.separatorColor = UIColor.CPBase100
        tableView.separatorStyle = .none
        tableView.rowHeight = 300
        tableView.reloadData()*/
        let flowLayout = UICollectionViewFlowLayout()
        //flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
       // flowLayout.itemSize = CGSize(width: 200, height: 300)
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
        //self.updateDataSourceDelegate(movies: [SubCategoryModel(list: [moview], title: "Nuevas")])
        updateCellWith(row: moview.results)
    }
    var collectionViewOffset: CGFloat {
        set { movieCollectioView?.contentOffset.x = newValue }
        get { return movieCollectioView?.contentOffset.x ?? 0}
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
            //self.cellDelegate?.collectionView(collectionviewcell: cellCollection,
              //                                selectMovie: itemMovie,
                //                              didTappedInTableViewCell: self)
        })
        
        DispatchQueue.main.async {
            self.movieCollectioView?.delegate = self.collectionDelegate
            self.movieCollectioView?.dataSource = self.collectiondataSource
            self.movieCollectioView?.register(UINib(nibName: MovieTableViewCell.cellCollectionViewIdentifier, bundle: nil),
                                                 forCellWithReuseIdentifier: MovieTableViewCell.cellCollectionViewIdentifier)
            self.movieCollectioView?.reloadData()
        }
    }
    
    /*func updateDataSourceDelegate(movies: [SubCategoryModel]){
        
        self.tableDataSource = MovieTableViewDataSource(cellIdentifier: self.cellIdentifier,
                                                        items: movies,
                                                        configureCell: { (cell, movieTV) in
            // Show Sub Category Title
            //cell.movieNameLabel.text = movieTV.title ///EncryptionTool.share.decrypString(string64: movieTV.title ?? "")  ?? ""
            //cell.movieNameLabel.font = CPFont.gothamMedium.size()// MvFont.GothamMedium.of(size: 14)
            // Pass the data to colletionview inside the tableviewcell
//            cell.updateCellWith(row: movieTV.results?.sorted(by: { $0.voteCount! > $1.voteCount! }))
            cell.updateCellWith(row: movieTV.results)
            // Set cell's delegate
            cell.cellDelegate = self
        })
        
        /*self.tableDelegate = MovieTableViewDelegate(cellIdentifier:self.headerCellIdentifier,
                                                    items: movies,
                                                    configureCell: { (cell, evm) in
            cell.setTitle(evm.title)
        })*/
        initUI()
       /* self.setupUI()
        
        if movies.count <= 0 {
            alertCustom.shared.alertShow(self, message:  "No se pueden ver las listas por el momento.", completionHandler: { success in })
        }*/
    }*/
}
/*extension CPAiringTodayView: MovieCollectionViewCellDelegate {
    
    func collectionView(collectionviewcell: MovieCollectionViewCell?,
                        selectMovie: CollectionMoviesModel?,
                        didTappedInTableViewCell: MovieTableViewCell) {
        /*let section = didTappedInTableViewCell.tag
        self.selectMovie = selectMovie
        self.selectMovie?.type = ListSection.init(rawValue: section) == .tv ? (List.tv.rawValue) : (List.movie.rawValue)
        performSegue(withIdentifier: "movieDetailsViewVontrollerSeg", sender: self)
          */  // You can also do changes to the cell you tapped using the 'collectionviewcell'
    }
}
*/
