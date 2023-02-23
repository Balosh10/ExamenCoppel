//
//  CPAlert.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 23/02/23.
//

import Foundation
import UIKit

struct CPAlert {
    
    static var shared: CPAlert {
        return CPAlert()
    }
    
    func alertShow(_ targetVC: UIViewController,
                   title: String = "\n",
                   message: String,
                   actualizar:String = "OK",
                   completionHandler: ((_ success:Bool)-> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction((UIAlertAction(title: actualizar, style: .cancel, handler: {(action) -> Void in
                completionHandler?(true)
            })))
            targetVC.present(alert, animated: true, completion: nil)
        }
    }
}
