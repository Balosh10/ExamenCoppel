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
        logo.contentMode = .scaleAspectFill
        logo.layer.cornerRadius = 39
        logo.clipsToBounds = true
        logo.layer.borderWidth = 2.0
        logo.layer.borderColor = UIColor.white.cgColor
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private lazy var lbName: UILabel = {
        var lbName = UILabel()
        lbName.translatesAutoresizingMaskIntoConstraints = false
        lbName.numberOfLines = 0
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
            lbName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44)
        ])
    }
    func loadData(item: CPAccount) {
        DispatchQueue.main.async {
            let info = NSMutableAttributedString().normal("Developer", .CPPrincipal, .left, .medium)
            info.append(NSMutableAttributedString().normal("\n\(item.username)", .CPPrincipal, .left, .medium))
            self.lbName.attributedText = info
            if let avatar = item.avatar.tmdb?.avatarPath,
               let url = URL(string: Setting.imageBase + avatar)  {
                self.imageUser.load(url: url)
            }
        }
    }
}
