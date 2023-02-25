//
//  MovieCollectionViewCell.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import UIKit

class CPMovieCollectionViewCell: UICollectionViewCell {
    private lazy var movieImage: CPRoundedImageView = {
        var movieImage = CPRoundedImageView()
        movieImage.contentMode = .scaleToFill
        movieImage.backgroundColor = .clear
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.radiusView()
        return movieImage
    }()
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.textColor = UIColor.CPPrincipal
        lbTitle.font = CPFont.gothamMedium.size(.medium)
        return lbTitle
    }()
    private lazy var lbInfo: UILabel = {
        var lbInfo = UILabel()
        lbInfo.translatesAutoresizingMaskIntoConstraints = false
        lbInfo.numberOfLines = 0
        lbInfo.textColor = UIColor.CPWhite100
        lbInfo.font = CPFont.gothamMedium.size(.smail)
        return lbInfo
    }()
    private lazy var lbDate: UILabel = {
        var lbDate = UILabel()
        lbDate.translatesAutoresizingMaskIntoConstraints = false
        lbDate.numberOfLines = 0
        lbDate.textColor = UIColor.CPPrincipal
        lbDate.font = CPFont.gothamMedium.size(.smail)
        lbDate.backgroundColor = .clear
        return lbDate
    }()
    private lazy var lbStart: UILabel = {
        var lbStart = UILabel()
        lbStart.translatesAutoresizingMaskIntoConstraints = false
        lbStart.numberOfLines = 0
        lbStart.textColor = UIColor.CPPrincipal
        lbStart.font = CPFont.gothamMedium.size(.smail)
        return lbStart
    }()
    private lazy var dataView: UIView = {
        var dataView = UIView()
        dataView.translatesAutoresizingMaskIntoConstraints = false
        dataView.backgroundColor = .clear
        return dataView
    }()
    private lazy var viewContent: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.viewShadow()
        contentView.backgroundColor = .clear
        return contentView
    }()
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var voteView: UIView = {
        var voteView = UIView()
        voteView.translatesAutoresizingMaskIntoConstraints = false
        voteView.backgroundColor = .clear
        return voteView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        backgroundColor = UIColor.clear
        contentView.addSubview(viewContent)
        [movieImage, dataView].forEach({viewContent.addSubview($0)})
        [lbTitle, stackView, lbInfo].forEach({ dataView.addSubview($0)})
        stackView.addArrangedSubview(lbDate)
        stackView.addArrangedSubview(voteView)
        voteView.addSubview(lbStart)

        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewContent.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewContent.topAnchor.constraint(equalTo: topAnchor),
            viewContent.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            movieImage.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            movieImage.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            movieImage.topAnchor.constraint(equalTo: viewContent.topAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 150),
            
            dataView.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            dataView.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            dataView.topAnchor.constraint(equalTo: movieImage.bottomAnchor),
            dataView.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor),
            
            lbTitle.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 6),
            lbTitle.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -6),
            lbTitle.centerXAnchor.constraint(equalTo: dataView.centerXAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -8),
            lbTitle.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 8),
            lbTitle.heightAnchor.constraint(equalToConstant: 20.33),
            
            stackView.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 6),
            stackView.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -6),
            stackView.centerXAnchor.constraint(equalTo: dataView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: lbInfo.topAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            stackView.heightAnchor.constraint(equalToConstant: 23),
            
            lbInfo.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 6),
            lbInfo.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -6),
            lbInfo.centerXAnchor.constraint(equalTo: dataView.centerXAnchor),
            lbInfo.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: -8),
            lbInfo.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            
            lbStart.trailingAnchor.constraint(equalTo: voteView.trailingAnchor),
            lbStart.bottomAnchor.constraint(equalTo: voteView.bottomAnchor),
            lbStart.topAnchor.constraint(equalTo: voteView.topAnchor)
        ])
    }
    func loadView(movie: CPCollectionMovies, type: CPList) {
        movieImage.setTopCornerRadius(rect: CGRect(x: 0,
                                                   y: 0,
                                                   width: contentView.frame.width,
                                                   height: 150))
        lbInfo.text = movie.overview

        let fullString = NSMutableAttributedString(string: "")
        let icStar = NSTextAttachment()
        let imageIcon = UIImage(systemName: "star.fill")?.withTintColor(.CPPrincipal, renderingMode: .alwaysOriginal)
        icStar.image = imageIcon
        icStar.bounds = CGRect(x: 0, y: -1, width: 12, height: 12)
        let image1String = NSAttributedString(attachment: icStar)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: String( " \(movie.voteCount ?? 0)")))
        lbStart.attributedText = fullString
        
        switch type {
            case .movie:
                lbTitle.text = movie.title
                if let releaseDate = movie.releaseDate,
                   let release = releaseDate.formatter(.yyyyMMdd) {
                    lbDate.text = release.formatter(.ddMMMyyyy)?.capitalized ?? ""
                }
            case .tv:
                lbTitle.text = movie.name
                if let releaseDate = movie.firstAirDate,
                   let release = releaseDate.formatter(.yyyyMMdd) {
                    lbDate.text = release.formatter(.ddMMMyyyy)?.capitalized ?? ""
                }
        }
        guard let url:URL = URL(string: CPSetting.imageBase + (movie.posterPath ?? "")) else { return }
        movieImage.load(url: url)
    }
}
