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
    private var collectiondataSource: CPCollectionViewDataSource<MovieCollectionViewCell, CPCollectionMovies>!
    
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
        let size = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 300)
        flowLayout.itemSize = size
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
            collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 22),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    func loadData(movies: [CPCollectionMovies], type: CPList) {
        self.collectiondataSource = CPCollectionViewDataSource(cellIdentifier: cellCollectionViewIdentifier,
                                                               items: movies,
                                                               configureCell: { (cellCollection, itemMovie) in
            guard let data = itemMovie else { return }
            cellCollection.loadView(movie: data, type: type)
        })
        DispatchQueue.main.async {
            self.movieCollectioView?.dataSource = self.collectiondataSource
            self.movieCollectioView?.register(UINib(nibName: self.cellCollectionViewIdentifier, bundle: nil),
                                              forCellWithReuseIdentifier: self.cellCollectionViewIdentifier)
            self.movieCollectioView?.reloadData()
        }
    }
    var collectionViewOffset: CGFloat {
        set { movieCollectioView?.contentOffset.x = newValue }
        get { return movieCollectioView?.contentOffset.x ?? 0}
    }
    func showError(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
