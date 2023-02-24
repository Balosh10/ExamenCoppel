//
//  CPProfileDataView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import UIKit

internal class CPProfileDataView: UIView {
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.text = "Profile"
        lbTitle.textColor = UIColor.CPPrincipal
        lbTitle.font = CPFont.gothamMedium.size(.title)
        return lbTitle
    }()
    private lazy var imageUser: UIImageView = {
        var logo = UIImageView()
        logo.image = CPIcon.of(.logoMovie)
        logo.contentMode = .scaleToFill
        logo.layer.cornerRadius = 16
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private lazy var lbName: UILabel = {
        var lbName = UILabel()
        lbName.translatesAutoresizingMaskIntoConstraints = false
        lbName.numberOfLines = 0
        lbName.text = AppInfo.shared.developer
        lbName.textColor = UIColor.CPPrincipal
        lbName.font = CPFont.gothamMedium.size(.medium)
        return lbName
    }()
    private lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
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
        contentView.addSubview(imageUser)
        contentView.addSubview(lbName)
        NSLayoutConstraint.activate([
            lbTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lbTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbTitle.heightAnchor.constraint(equalToConstant: 44),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentView.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageUser.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageUser.trailingAnchor.constraint(equalTo: imageUser.leadingAnchor, constant: -16),
            imageUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageUser.heightAnchor.constraint(equalToConstant: 78),
            imageUser.widthAnchor.constraint(equalToConstant: 78),
            lbName.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 16),
            lbName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lbName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44),
            lbName.heightAnchor.constraint(equalToConstant: 24),
        ])
        imageUser.radiusCircle()
    }
}
