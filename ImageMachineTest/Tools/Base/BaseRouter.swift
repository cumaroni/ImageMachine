//
//  BaseRouter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

class BaseRouter {
    
    class func createNavbar(_ root: UIViewController) -> UINavigationController {
        let navBar = UINavigationController(rootViewController: root)
        navBar.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navBar.navigationBar.shadowImage = UIImage()
        navBar.navigationBar.isTranslucent = true
        navBar.navigationBar.tintColor = .clear
        navBar.view.backgroundColor = .clear
        navBar.setNavigationBarHidden(true, animated: true)
        return navBar
    }
}
