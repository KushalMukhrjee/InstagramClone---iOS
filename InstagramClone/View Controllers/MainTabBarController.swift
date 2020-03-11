//
//  MainTabBarController.swift
//  InstagramClone
//
//  Created by ndVOR on 05/03/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var feedViewNavigationController: UINavigationController!
    var searchViewNavigationController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFeedViewController()
        setupSearchViewController()
        self.viewControllers = [feedViewNavigationController,searchViewNavigationController]
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupFeedViewController() {
        
       feedViewNavigationController = UINavigationController()
       let feedViewController = FeedViewController()
       feedViewNavigationController.viewControllers = [feedViewController]
       feedViewNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.homeImageName), tag: 0)

    }
    
    func setupSearchViewController() {
        
        searchViewNavigationController = UINavigationController()
        let searchViewController = SearchViewController()
        searchViewNavigationController.viewControllers = [searchViewController]
        searchViewNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.searchImageName), tag: 1)
        
    }
    

}
