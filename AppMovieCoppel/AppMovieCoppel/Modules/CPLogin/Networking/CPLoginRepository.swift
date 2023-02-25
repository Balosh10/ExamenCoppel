//
//  PRLoginRepository.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

protocol CPLoginRepository: AnyObject {
    func createRequestToken(_ completion: @escaping(Result<CPRequestToken, NSError>) -> Void)
    func createSesionWithLogin(_ userName: String,
                               _ password: String,
                               _ completion: @escaping(Result<CPSesionUser, NSError>) -> Void)
    func createGuestSessionNew(_ completion: @escaping(Result<CPGuestSessionNew, NSError>) -> Void)
    func createDeleteSesion(_ completion: @escaping(Result<CPDeleteSesion, NSError>) -> Void)
}

