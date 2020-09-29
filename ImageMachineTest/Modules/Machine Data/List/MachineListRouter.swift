//
//  MachineListRouter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineListRouter: MachineListRouterDelegate {
    weak var source: UIViewController?
    
    init(view: MachineListViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToMachineAdd() {
        let addVc = MachineAddController()
        source?.navigationController?.pushViewController(addVc, animated: true)
    }
}
