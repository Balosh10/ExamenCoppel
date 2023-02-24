//
//  CPLoginView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
import UIKit

internal class CPLoginView: UIViewController {
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
        name.setPlaceholder(placeholder: Localizable.text(.username))
        name.delegate = self
        name.autocorrectionType = .no
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private lazy var textPassword: CPTextField = {
        var pasword = CPTextField()
        pasword.setPlaceholder(placeholder: Localizable.text(.password))
        pasword.delegate = self
        pasword.isSecureTextEntry = true
        pasword.autocorrectionType = .no
        pasword.translatesAutoresizingMaskIntoConstraints = false
        return pasword
    }()
    private lazy var btnLogin: CPButton = {
        var login = CPButton()
        login.title = "Log In"
        login.styleButton = .inactive
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    private lazy var messageError: UILabel = {
        var messageError = UILabel()
        messageError.translatesAutoresizingMaskIntoConstraints = false
        messageError.numberOfLines = 0
        return messageError
    }()
    private lazy var contentView: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private lazy var contentViewDegradate: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 22
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
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
        setupScrollView()
        setupImageBackground()
        gradientImageBackground()
        [logo, stackView, messageError].forEach({ contentView.addSubview($0)})
        [textName, textPassword, btnLogin].forEach({ stackView.addArrangedSubview($0)})
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            logo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            logo.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -44),
            logo.heightAnchor.constraint(equalToConstant: 75),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 180),
            messageError.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            messageError.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44),
            messageError.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 44),
        ])
        btnLogin.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.presenter?.logIn(self.textName.text!, self.textPassword.text!)
        }
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
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.bringSubviewToFront(scrollView)
        scrollView.addSubview(contentView)
        scrollView.bringSubviewToFront(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
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
                                                                                          UIColor.black.withAlphaComponent(0.5).cgColor,
                                                                                          UIColor.black.withAlphaComponent(1).cgColor])
    }
    func showError(text: String) {
        DispatchQueue.main.async {
            self.messageError.attributedText = NSMutableAttributedString().boldText(text, UIColor.CPRed100, .center)
        }
    }
}

extension CPLoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !textName.text!.isEmpty && !textPassword.text!.isEmpty {
            btnLogin.styleButton = .primary
            btnLogin.isEnabled = true
        } else {
            btnLogin.styleButton = .inactive
            btnLogin.isEnabled = false
        }
        return true
    }
}
