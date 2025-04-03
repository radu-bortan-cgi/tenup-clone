//
//  MainTabBarControllerViewController.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabs()
    }
    

    private func configureTabs() {
        let homeViewController = HomeViewController()
        let competitionsViewController = CompetitionsViewController()
        let advantagesViewController = AdvantagesViewController()
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house.fill")?.withTintColor(.black)
        competitionsViewController.tabBarItem.image = UIImage(named: "star.fill")?.withTintColor(.black)
        advantagesViewController.tabBarItem.image = UIImage(named: "info.circle.fill")?.withTintColor(.black)
        
        homeViewController.title = "Accueil"
        competitionsViewController.title = "Competitions"
        advantagesViewController.title = "Avantages"
        
        let homeNavigation = UINavigationController(rootViewController: homeViewController)
        let competionsNavigation = UINavigationController(rootViewController: competitionsViewController)
        let advantagesNavigation = UINavigationController(rootViewController: advantagesViewController)
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 15
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.black.cgColor
        
        setViewControllers([homeNavigation, competionsNavigation, advantagesNavigation], animated: true)
    }
}
