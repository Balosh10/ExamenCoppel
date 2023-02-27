//
//  CPLogOutRepository.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 24/02/23.
//

import Foundation

protocol CPLogOutRepository: AnyObject {
    func createDeleteSesion(_ completion: @escaping(Result<CPDeleteSesion, NSError>) -> Void)
}
