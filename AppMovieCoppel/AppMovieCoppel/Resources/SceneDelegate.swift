//
//  SceneDelegate.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import UIKit

var currentScene: UIScene?
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        currentScene = scene
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let backgroundView = CPBackgroundRouter.createCPBackgroundModule()
        window?.rootViewController = UINavigationController(rootViewController: backgroundView)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate {
    func showLoginView() {
        DispatchQueue.main.async {
            let loginView = CPLoginRouter.createCPLoginModule()
            self.window?.rootViewController = loginView
            self.window?.makeKeyAndVisible()
        }
    }
    func showBackgroundView(message: String) {
        DispatchQueue.main.async {
            var data = CPDataBackground()
            data.type = .logOut
            data.message = message
            let backgroundView = CPBackgroundRouter.createCPBackgroundModule(from: data)
            self.window?.rootViewController = backgroundView
            self.window?.makeKeyAndVisible()
        }
    }
    func showHomeView() {
        DispatchQueue.main.async {
            let dashboardView = CPTapBarRouter.createCPTapBarModule()
            self.window?.rootViewController = UINavigationController(rootViewController: dashboardView)
            self.window?.makeKeyAndVisible()
        }
    }
}
