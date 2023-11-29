//
//  PrimaryTabViewController.swift
//  Xplor-App
//
//  Created by Ozgun Dogus on 22.08.2023.
//

import UIKit

//Some if there is a user signed in
class PrimaryTabViewController: UITabBarController {

    let databaseService = DatabaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

            configureTabBars()
         
    }
    
    private func configureTabBars() {
        let vc1 = HomeViewController(databaseService: databaseService)
        let vc2 = FavoritesViewController()
        
        
        vc1.tabBarItem.image = UIImage(systemName: "shuffle")
        vc2.tabBarItem.image = UIImage(systemName: "heart")
        
        vc1.title = "Xplor"
        vc2.title = "Favorites"
        
    
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        
        setViewControllers([nav1,nav2], animated: true)
    }
    

   
}
