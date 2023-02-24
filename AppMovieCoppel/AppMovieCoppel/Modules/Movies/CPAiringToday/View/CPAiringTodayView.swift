//
//  CPDashboardView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPAiringTodayView: UITableViewController {

    // MARK: Properties
    var presenter: CPAiringTodayPresenterProtocol?
    private var tableDataSource: MovieTableViewDataSource<MovieTableViewCell, SubCategoryModel>!
    private var tableDelegate: MovieTableViewDelegate<MovieHeaderTableViewCell, SubCategoryModel>!
    private var cellIdentifier = "MovieTableViewCell"
    private var headerCellIdentifier = "MovieHeaderTableViewCell"
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
}

extension CPAiringTodayView: CPAiringTodayViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase200
        DispatchQueue.main.async {
            self.tableView.delegate = self.tableDelegate
            self.tableView.dataSource = self.tableDataSource
            self.tableView.register(UINib(nibName: self.cellIdentifier, bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
            self.tableView.register(UINib(nibName: self.headerCellIdentifier, bundle: nil), forCellReuseIdentifier: self.headerCellIdentifier)
            self.tableView.reloadData()
        }
        tableView.backgroundColor = .CPBase200
        tableView.separatorColor = UIColor.CPBase200
        tableView.separatorStyle = .none
        var moview = MoviesModel()
        moview.title = "hdd"
        var dd = CollectionMoviesModel()
        dd.title = "aa"
        dd.type = "aaasdd"
        moview.results = [dd]
        moview.type = "sss"
        updateDataSourceDelegate(movies: [SubCategoryModel(list: [moview], title: "Nuevas")])
    }
    func updateDataSourceDelegate(movies: [SubCategoryModel]){
        
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
        
        self.tableDelegate = MovieTableViewDelegate(cellIdentifier:self.headerCellIdentifier,
                                                    items: movies,
                                                    configureCell: { (cell, evm) in
            // Show Category Title
            //cell.movieTitleLabel.text = evm.title//EncryptionTool.share.decrypString(string64: )  ?? ""
           // cell.movieTitleLabel.font = CPFont.gothamMedium.size()
        })
       /* self.setupUI()
        
        if movies.count <= 0 {
            alertCustom.shared.alertShow(self, message:  "No se pueden ver las listas por el momento.", completionHandler: { success in })
        }*/
    }
}
extension CPAiringTodayView: MovieCollectionViewCellDelegate {
    
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
