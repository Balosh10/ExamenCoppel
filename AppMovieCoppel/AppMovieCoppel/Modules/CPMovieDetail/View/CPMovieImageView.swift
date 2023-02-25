//
//  CPMovieDescriptionView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 25/02/23.
//

import UIKit

internal class CPMovieImageView: UIView {
    private lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private lazy var imageMovie: UIImageView = {
        var logo = UIImageView()
        logo.contentMode = .scaleToFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private lazy var contentViewDegradate: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private lazy var infoView: UIView = {
        var infoView = UIView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.radiusView(radius: 16)
        infoView.backgroundColor = UIColor.CPGray100.withAlphaComponent(0.2)
        return infoView
    }()
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.textColor = UIColor.CPWhite100
        lbTitle.font = CPFont.gothamMedium.size(.large)
        return lbTitle
    }()
    private lazy var lbGenres: UILabel = {
        var lbGenres = UILabel()
        lbGenres.translatesAutoresizingMaskIntoConstraints = false
        lbGenres.numberOfLines = 0
        lbGenres.textColor = UIColor.CPWhite100
        lbGenres.font = CPFont.gothamMedium.size(.smail)
        lbGenres.radiusView(radius: 14, .CPBlue100)
        return lbGenres
    }()
    private lazy var lbHours: UILabel = {
        var lbHours = UILabel()
        lbHours.translatesAutoresizingMaskIntoConstraints = false
        lbHours.numberOfLines = 0
        lbHours.textColor = UIColor.CPWhite100
        lbHours.font = CPFont.gothamMedium.size(.smail)
        lbHours.radiusView(radius: 14, .CPPurple100)
        return lbHours
    }()
    private lazy var lbVoteAverage: UILabel = {
        var lbVoteAverage = UILabel()
        lbVoteAverage.translatesAutoresizingMaskIntoConstraints = false
        lbVoteAverage.numberOfLines = 0
        lbVoteAverage.textColor = UIColor.CPWhite100
        lbVoteAverage.font = CPFont.gothamMedium.size(.smail)
        lbVoteAverage.radiusView(radius: 14, .CPYellow100)
        return lbVoteAverage
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
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        contentView.backgroundColor = .red
        imageMovie.backgroundColor = .CPBase100
        setupImageBackground()
        gradientImageBackground()
        addInfoView()
    }
    func setupImageBackground() {
        contentView.addSubview(imageMovie)
        contentView.sendSubviewToBack(imageMovie)
        NSLayoutConstraint.activate([
            imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageMovie.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageMovie.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func gradientImageBackground() {
        contentView.addSubview(contentViewDegradate)
        contentView.insertSubview(contentViewDegradate, at: 1)
        NSLayoutConstraint.activate([
            contentViewDegradate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentViewDegradate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentViewDegradate.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentViewDegradate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        let bounds = UIScreen.main.bounds
        contentViewDegradate.gradient(width: bounds.width,
                                      height: bounds.height,
                                      color: [UIColor.black.withAlphaComponent(0.2).cgColor,
                                              UIColor.black.withAlphaComponent(1).cgColor])
    }
    
    func addInfoView() {
        [lbTitle, lbGenres, lbHours, lbVoteAverage].forEach({ infoView.addSubview($0) })
        contentView.addSubview(infoView)
        contentView.insertSubview(infoView, at: 2)
        NSLayoutConstraint.activate([
            infoView.heightAnchor.constraint(equalToConstant: 120),
            infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            lbTitle.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            lbTitle.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            lbTitle.heightAnchor.constraint(equalToConstant: 44),
            
            lbGenres.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            lbGenres.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbGenres.heightAnchor.constraint(equalToConstant: 30),
            
            lbHours.leadingAnchor.constraint(equalTo: lbGenres.trailingAnchor, constant: 16),
            lbHours.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbHours.heightAnchor.constraint(equalToConstant: 30),
            
            lbVoteAverage.leadingAnchor.constraint(equalTo: lbHours.trailingAnchor, constant: 16),
            lbVoteAverage.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbVoteAverage.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    func loadInfoMovie(item: CPMovieDetail) {
        lbTitle.text = item.title
        if let genres = item.genres?.first {
            lbGenres.text = "  \(genres.name ?? "")  "
        } else {
            lbGenres.isHidden = true
        }
        if let runtime = item.runtime {
            let divide: Double = Double(runtime / 60)
            let hours = Int(divide)
            let minute = divide.truncatingRemainder(dividingBy: 1) * 60
            lbHours.text = "  \(hours):\(minute) Horas  "
        } else {
            lbHours.isHidden = true
        }
        
        if let voteAverage = item.voteAverage?.toString(toPlaces: 1) {
            let fullString = NSMutableAttributedString(string: "  " + voteAverage + " ")
            let icStar = NSTextAttachment()
            let imageIcon = UIImage(systemName: "star.fill")?.withTintColor(.CPWhite100, renderingMode: .alwaysOriginal)
            icStar.image = imageIcon
            icStar.bounds = CGRect(x: 0, y: -1, width: 12, height: 12)
            let image1String = NSAttributedString(attachment: icStar)
            fullString.append(image1String)
            fullString.append(NSAttributedString(string: "   "))
            lbVoteAverage.attributedText = fullString
        } else {
            lbVoteAverage.isHidden = true
        }
        
        if let posterPath = item.posterPath,
           let url:URL = URL(string: CPSetting.imageBase + posterPath) {
            self.imageMovie.load(url: url)
        }
    }
}
