//
//  TabBarController.swift
//  OnayCode
//
//  Created by Mereke on 06.03.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        tabBar.tintColor = .systemBlue
        view.backgroundColor = .white
        view.layer.opacity = 0.95
        tabBar.frame.size.height = 96

        let vc1 = UIViewController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)

        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: "Media", image: UIImage(systemName: "photo"), selectedImage: nil)

        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "book"), selectedImage: nil)

        let vc4 = UIViewController()
        vc4.tabBarItem = UITabBarItem(title: "Leaders", image: UIImage(systemName: "person.2.square.stack"), selectedImage: nil)

        let vc5 = UIViewController()
        vc5.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)

        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
}
