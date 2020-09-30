//
//  MachineDetailRouter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineDetailRouter: MachineDetailRouterDelegate {
    weak var source: UIViewController?
    
    init(view: MachineDetailViewControllerDelegate?) {
        source = view as? UIViewController
    }
}
