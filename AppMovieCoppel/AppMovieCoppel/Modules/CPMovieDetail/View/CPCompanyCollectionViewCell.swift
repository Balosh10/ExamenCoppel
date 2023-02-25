//
//  CPCompanyCollectionViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import UIKit

class CPCompanyCollectionViewCell: UICollectionViewCell {
    
    private lazy var companyImage: CPRoundedImageView = {
        var companyImage = CPRoundedImageView()
        companyImage.contentMode = .scaleToFill
        companyImage.backgroundColor = .CPBase200
        companyImage.translatesAutoresizingMaskIntoConstraints = false
        companyImage.radiusView()
        return companyImage
    }()
    
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.textColor = UIColor.CPWhite100
        lbTitle.font = CPFont.gothamMedium.size(.large)
        return lbTitle
    }()
    
    private lazy var viewContent: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.viewShadow()
        contentView.backgroundColor = .CPBase200
        return contentView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews() {
        backgroundColor = UIColor.clear
        contentView.addSubview(viewContent)
        [companyImage, lbTitle].forEach({viewContent.addSubview($0)})
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewContent.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewContent.topAnchor.constraint(equalTo: topAnchor),
            viewContent.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            companyImage.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            companyImage.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            companyImage.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            companyImage.topAnchor.constraint(equalTo: viewContent.topAnchor),
            companyImage.heightAnchor.constraint(equalToConstant: 150),
            
            lbTitle.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -16),
            lbTitle.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -16),
            lbTitle.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 16)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(item: CPProductionCompany) {
        if let logoPath = item.logoPath,
           let url:URL = URL(string: CPSetting.imageBase + logoPath) {
            companyImage.load(url: url)
        }
        lbTitle.text = item.name
        let frame = contentView.bounds
        let rect = CGRect(x: 0, y: 0, width: frame.width, height: 150)
        companyImage.setTopCornerRadius(rect: rect)
    }
}
