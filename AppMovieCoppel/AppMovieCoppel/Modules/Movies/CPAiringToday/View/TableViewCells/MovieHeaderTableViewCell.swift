//
//  MovieHeaderTableViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

class MovieHeaderTableViewCell: UITableViewCell {
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .CPText100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var viewContent: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    
    var movie: SubCategoryModel? {
        didSet {
            lblTitle.text = movie?.title ?? ""
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .clear
        addViews()
    }
    func addViews(){
        contentView.addSubview(viewContent)
        viewContent.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            lblTitle.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 8),
            lblTitle.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            lblTitle.heightAnchor.constraint(equalToConstant: 44),
            lblTitle.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -8)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
