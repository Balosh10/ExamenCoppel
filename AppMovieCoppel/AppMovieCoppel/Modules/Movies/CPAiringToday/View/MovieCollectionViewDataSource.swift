//
//  MovieCollectionViewDataSource.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
import UIKit

class MovieCollectionViewDataSource<CELL : UICollectionViewCell,T> : NSObject, UICollectionViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]?
    var configureCell : (CELL, T?) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [T]?, configureCell : @escaping (CELL, T?) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        self.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items?[indexPath.row]
        self.configureCell(cell, item)
        cell.backgroundColor = .black
        return cell
    }
}
