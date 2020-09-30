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
    
    func presentSortAlert(_ isSorted: @escaping (Bool) -> Void) {
        source?.presentActionSheet(title: "Sort By", message: "", alertAction: [
            UIAlertAction(title: "Name", style: .default, handler: { _ in
                isSorted(true)
            }),
            UIAlertAction(title: "Type", style: .default, handler: { _ in
                isSorted(false)
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ])
    }
}
