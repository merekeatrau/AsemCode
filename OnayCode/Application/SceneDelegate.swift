//
//  SceneDelegate.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()

        let homeVC = ViewController()
        homeVC.title = "Course content"
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        let mediaVC = UIViewController()
        mediaVC.title = "Media"
        mediaVC.view.backgroundColor = .systemGreen
        let mediaNav = UINavigationController(rootViewController: mediaVC)
        mediaNav.tabBarItem = UITabBarItem(title: "Media", image: UIImage(systemName: "photo"), tag: 1)

        let coursesVC = UIViewController()
        coursesVC.title = "Courses"
        coursesVC.view.backgroundColor = .systemBlue
        let coursesNav = UINavigationController(rootViewController: coursesVC)
        coursesNav.tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "book"), tag: 2)

        let leadersVC = UIViewController()
        leadersVC.title = "Leaders"
        leadersVC.view.backgroundColor = .systemMint
        let leadersNav = UINavigationController(rootViewController: leadersVC)
        leadersNav.tabBarItem = UITabBarItem(title: "Leaders", image: UIImage(systemName: "person.2.square.stack"), tag: 3)

        let profileVC = UIViewController()
        profileVC.title = "Profile"
        profileVC.view.backgroundColor = .systemTeal
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 4)

        tabBarController.viewControllers = [homeNav, mediaNav, coursesNav, leadersNav, profileNav]

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

