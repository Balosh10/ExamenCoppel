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
        label.textColor = .CPPrincipal
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var viewContent: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        addViews()
    }
    func addViews(){
        contentView.addSubview(viewContent)
        viewContent.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            viewContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            viewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            viewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
            lblTitle.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 8),
            lblTitle.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 0),
            lblTitle.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -8),
            lblTitle.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -0)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitle(_ title: String) {
        lblTitle.text = title
    }
}
