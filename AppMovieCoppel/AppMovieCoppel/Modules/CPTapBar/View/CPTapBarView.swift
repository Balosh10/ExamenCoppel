//
//  CPTapBarView.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//  
//

import UIKit

class CPTapBarView: UIViewController {
    private lazy var viewSegmentedControl: UIView = {
        var viewSegmentedControl = UIView()
        viewSegmentedControl.backgroundColor = UIColor.clear
        viewSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return viewSegmentedControl
    }()
    private lazy var uiSegmentedControl: UISegmentedControl = {
        var uiSegmentedControl = UISegmentedControl()
        uiSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        uiSegmentedControl.backgroundColor = UIColor.clear
        return uiSegmentedControl
    }()
   
    var presenter: CPTapBarPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
extension CPTapBarView: CPTapBarViewProtocol {
    func initUI() {
        title = Localizable.text(.tvShow)
        view.backgroundColor = UIColor.CPBase200
        view.addSubview(viewSegmentedControl)
        viewSegmentedControl.addSubview(uiSegmentedControl)
        NSLayoutConstraint.activate([
            viewSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            viewSegmentedControl.heightAnchor.constraint(equalToConstant: 44),
            uiSegmentedControl.leadingAnchor.constraint(equalTo: viewSegmentedControl.leadingAnchor, constant: 16),
            uiSegmentedControl.topAnchor.constraint(equalTo: viewSegmentedControl.topAnchor, constant: 8),
            uiSegmentedControl.trailingAnchor.constraint(equalTo: viewSegmentedControl.trailingAnchor, constant: -16),
            uiSegmentedControl.bottomAnchor.constraint(equalTo: viewSegmentedControl.bottomAnchor, constant: 0)
        ])
        uiSegmentedControl.tag = 20
        uiSegmentedControl.removeAllSegments()
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        uiSegmentedControl.ensureiOS12Style()
        uiSegmentedControl.insertSegment(withTitle: CPTapsName.popular.rawValue, at: CPTaps.popular.rawValue, animated: true)
        uiSegmentedControl.insertSegment(withTitle: CPTapsName.topRated.rawValue, at: CPTaps.topRated.rawValue, animated: true)
        uiSegmentedControl.insertSegment(withTitle: CPTapsName.onTV.rawValue, at: CPTaps.onTV.rawValue, animated: true)
        uiSegmentedControl.insertSegment(withTitle: CPTapsName.airingToday.rawValue, at: CPTaps.airingToday.rawValue, animated: true)
        uiSegmentedControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        uiSegmentedControl.selectedSegmentIndex = CPTaps.popular.rawValue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: CPIcon.of(.icMenu),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapMenu))
        statusBarView(color: UIColor.CPGray200)
        selectionDidChange()
    }
    @objc func selectionDidChange() {
        guard let type = CPTaps.init(rawValue: uiSegmentedControl.selectedSegmentIndex) else { return }
        presenter?.selectionDidChange(type: type)
    }

    @objc func didTapMenu() {
        CPAlert.shared.actionSheet(targetVC: self) { [weak self] typeTap in
            guard let self = self else { return }
            self.presenter?.selecTap(type: typeTap)
        }
    }
    func showInfo(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
