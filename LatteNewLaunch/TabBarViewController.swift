//
//  TabBarViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tabBar.frame.size.height = 100
        tabBar.layer.cornerRadius = 24
    }
    
    // MARK: - setupTabBar
    
    private func setupTabBar() {
        viewControllers = [
            generateViewController(viewController: HomeViewController(), title: "", image: AppImage.home.uiImage),
            generateViewController(viewController: CartViewController(), title: "", image: AppImage.bag.uiImage),
            generateViewController(viewController: DeliveryViewController(), title: "", image: AppImage.notf.uiImage)
        ]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tabBar.backgroundColor = UIColor(named: "tabbar")
    }
    
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysTemplate)
        viewController.tabBarItem.selectedImage = image?.withTintColor(AppColor.orange.uiColor)
        return viewController
    }
}
