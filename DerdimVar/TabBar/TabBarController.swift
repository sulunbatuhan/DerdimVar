//
//  TabBarController.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //let main = MainViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let mainNavigationController = UINavigationController(rootViewController: MainViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        let searchNavigationController = UINavigationController(rootViewController: SearchVC())
        let contentNavigationController = UINavigationController(rootViewController: ContentVC())
        let profileNavigationController = UINavigationController(rootViewController: ProfileVC())
    
        mainNavigationController.tabBarItem.image = UIImage(systemName: "house")
        searchNavigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        contentNavigationController.tabBarItem.image = UIImage(systemName: "pencil")
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person")
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBar.tintColor = .black
        
        viewControllers = [mainNavigationController,searchNavigationController,contentNavigationController,profileNavigationController]
        
        guard let items = tabBar.items else {return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        }
    }
    // MARK: - Navigation
    func navigationControlSystem(){
        
    }

}
