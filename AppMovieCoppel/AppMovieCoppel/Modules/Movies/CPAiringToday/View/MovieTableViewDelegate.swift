//
//  MovieTableViewDelegate.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
import UIKit

class MovieTableViewDelegate<CELL:UITableViewCell,T> : NSObject, UITableViewDelegate {
    
    private var storedOffsets = [Int: CGFloat]()
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> Void = {_,_ in }
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 26))
        let headerCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CELL
        let item = items[section]
        headerCell.frame = headerView.frame
        headerView.addSubview(headerCell)
        configureCell(headerCell, item)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       guard let tableViewCell = cell as? MovieTableViewCell else { return }
       tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MovieTableViewCell else { return }
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
}

