//
//  UISegmentedControl+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
import UIKit

extension UISegmentedControl {
    /// Tint color doesn't have any effect on iOS 13.
    func ensureiOS12Style() {
        if #available(iOS 13, *) {
            setTitleTextAttributes([.foregroundColor: UIColor.white,
                                    NSAttributedString.Key.font: CPFont.gothamMedium.size()],
                                   for: UIControl.State.selected)
            setTitleTextAttributes([.foregroundColor: UIColor.white,
                                    NSAttributedString.Key.font: CPFont.gothamMedium.size()],
                                    for: .normal)
            setDividerImage(UIImage().colored(with: UIColor.white,
                                              size: CGSize(width: 0.5, height: 1),
                                              isClear: true),
                            forLeftSegmentState: .normal,
                            rightSegmentState: .normal,
                            barMetrics: .default)
            setBackgroundImage(UIImage().colored(with: UIColor.CPBase200, size: CGSize(width: 1, height: 44)), for: .normal, barMetrics: .default)
            setBackgroundImage(UIImage().colored(with: UIColor.CPGray100, size: CGSize(width: 1, height: 44)), for: .selected, barMetrics: .default);
            layer.borderWidth = 0
            layer.borderColor = UIColor.clear.cgColor
            backgroundColor = .clear
        }
    }
}
