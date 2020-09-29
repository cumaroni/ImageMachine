//
//  MachineAddRouter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineAddRouter: MachineAddRouterDelegate {
    weak var source: UIViewController?
    
    init(view: MachineAddViewControllerDelegate?) {
        source = view as? UIViewController
    }
}
