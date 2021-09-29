//
//  TabBarViewController.swift
//  Trivia
//
//  Created by Alejandro O. on 28-09-21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         

        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        let firstTabViewController = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTabViewController.title = firstTabTitle
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
        
        
        let secondTabTitle = "Random"
        let secondTabImage = UIImage(systemName: "shuffle")
        let secondTabViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        secondTabViewController.title = secondTabTitle
        let secondTabNavigationController = UINavigationController(rootViewController: secondTabViewController)
        secondTabNavigationController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)
        
        viewControllers = [firstTabNavigationController, secondTabNavigationController]
    }
}
