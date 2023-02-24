//
//  UIView+Extension.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

extension UIView {
    func gradient(width:CGFloat,
                  height:CGFloat,
                  color: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = color
        gradientLayer.locations = [0, 0.4, 1]
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: width,
                                     height: height)
        layer.insertSublayer(gradientLayer, at:0)
    }
    
    func radiusCircle(_ backgroundColor: UIColor = .CPWhite100,
                      _ borderColor: UIColor = .CPWhite100) {
        layer.cornerRadius = layer.frame.width / 2
        clipsToBounds = true
        self.backgroundColor = backgroundColor
        layer.borderWidth = 1
        layer.borderColor = borderColor.withAlphaComponent(0.5).cgColor
        
    }
    
    func radiusView(radius: CGFloat = 10.0, _ backgroundColor: UIColor = .CPWhite100){
        layer.cornerRadius = radius
        clipsToBounds = true
        self.backgroundColor = backgroundColor
    }
    
    func viewShadow(isRadius:Bool = true) {
        layer.masksToBounds = false
        layer.cornerRadius = isRadius ? 8 :0
        layer.borderWidth = isRadius ? 0.1 : 0.3
        layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
    }
    
    func addShadow(offset: CGSize,
                   color: UIColor,
                   radius: CGFloat,
                   opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    func addSubviews(_ views: UIView...) {
        views.forEach{ addSubview($0) }
    }
    func animationView() {
        isHidden = true
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = false
        })
    }
    func removeFromSuperviewAll(tag:Int) {
        while let viewRemove = viewWithTag(tag) {
            viewRemove.removeFromSuperview()
        }
    }
    func addTapGesture(action: @escaping () -> Void) {
        let tap = MyTapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer){
        sender.action!()
    }
}

