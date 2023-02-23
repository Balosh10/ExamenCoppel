//
//  CPLoginView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//  
//

import Foundation
import UIKit

class CPLoginView: UIViewController {

    // MARK: Properties
    var presenter: CPLoginPresenterProtocol?
    
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
    private lazy var textName: CPTextField = {
        var name = CPTextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private lazy var textPassword: CPTextField = {
        var pasword = CPTextField()
        pasword.translatesAutoresizingMaskIntoConstraints = false
        return pasword
    }()
    private lazy var btnLogin: CPButton = {
        var login = CPButton()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .blue
        return login
    }()
    private lazy var contentView: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private lazy var controlView: UIView = {
        var controlView = UIView()
        controlView.translatesAutoresizingMaskIntoConstraints = false
        controlView.backgroundColor = .yellow
        return controlView
    }()
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
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

extension CPLoginView: CPLoginViewProtocol {
    
    func initUI() {
        view.backgroundColor = .CPBase100
        statusBarView(color: UIColor.clear)
        setupImageBackground()
        setupScrollView()
        contentView.addSubview(controlView)
        [logo, stackView].forEach({ controlView.addSubview($0)})
        [textName, textPassword, btnLogin].forEach({ stackView.addArrangedSubview($0)})
        NSLayoutConstraint.activate([
            controlView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            controlView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            controlView.heightAnchor.constraint(equalToConstant: 200),
            controlView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: controlView.leadingAnchor, constant: 8),
            logo.trailingAnchor.constraint(equalTo: controlView.trailingAnchor, constant: -8),
            logo.topAnchor.constraint(equalTo: controlView.topAnchor, constant: 8),
            logo.heightAnchor.constraint(equalToConstant: 75),
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: controlView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: controlView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: controlView.bottomAnchor, constant: -8),
        ])
    }
    func setupScrollView() {
       view.addSubview(scrollView)
       scrollView.addSubview(contentView)
       NSLayoutConstraint.activate([
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
        scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
       ])
        let bounds = UIScreen.main.bounds
        contentView.gradient(width: bounds.width, height: bounds.height, color: [UIColor.black.withAlphaComponent(0.2).cgColor,
                                                                                 UIColor.black.withAlphaComponent(0.7).cgColor,
                                                                                 UIColor.black.withAlphaComponent(0.9).cgColor])
    }
    func setupImageBackground() {
        view.addSubview(bakcgroundImage)
        NSLayoutConstraint.activate([
            bakcgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bakcgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            bakcgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            bakcgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
