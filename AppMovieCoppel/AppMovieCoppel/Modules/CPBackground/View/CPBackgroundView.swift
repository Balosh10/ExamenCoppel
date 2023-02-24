//
//  CPBackgroundView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import Foundation
import UIKit

class CPBackgroundView: UIViewController {

    // MARK: Properties
    var presenter: CPBackgroundPresenterProtocol?
    
    private lazy var bakcgroundImage: UIImageView = {
        var logo = UIImageView()
        logo.image = CPIcon.of(.background)
        logo.contentMode = .scaleToFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private lazy var logo: UIImageView = {
        var logo = UIImageView()
        logo.image = CPIcon.of(.logoMovie)
        logo.contentMode = .scaleAspectFit
        logo.layer.cornerRadius = 16
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private lazy var messageError: UILabel = {
        var messageError = UILabel()
        messageError.translatesAutoresizingMaskIntoConstraints = false
        messageError.numberOfLines = 0
        return messageError
    }()
    private lazy var contentViewDegradate: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CPBackgroundView: CPBackgroundViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
        statusBarView(color: UIColor.clear)
        setupImageBackground()
        gradientImageBackground()
        CPLoader.show()
    }
    func setupImageBackground() {
        view.addSubview(bakcgroundImage)
        view.sendSubviewToBack(bakcgroundImage)
        NSLayoutConstraint.activate([
            bakcgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bakcgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            bakcgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            bakcgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func gradientImageBackground() {
        view.addSubview(contentViewDegradate)
        view.insertSubview(contentViewDegradate, at: 1)
        NSLayoutConstraint.activate([
            contentViewDegradate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentViewDegradate.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentViewDegradate.topAnchor.constraint(equalTo: view.topAnchor),
            contentViewDegradate.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        let bounds = UIScreen.main.bounds
        contentViewDegradate.gradient(width: bounds.width, height: bounds.height, color: [UIColor.black.withAlphaComponent(0.2).cgColor,
                                                                                          UIColor.black.withAlphaComponent(1).cgColor])
    }
    
    func showInfo(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
