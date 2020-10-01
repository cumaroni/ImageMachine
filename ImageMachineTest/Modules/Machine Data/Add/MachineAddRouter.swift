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
    
    func presentErrorAlert(_ message: String) {
        source?.presentAlert(title: "Failed", message: message, alertAction: [
            UIAlertAction(title: "Close", style: .cancel, handler: nil)
        ])
    }
    
    func presentSuccessAlert(_ message: String) {
        source?.presentAlert(title: "Success", message: "\(message) Machine Success", alertAction: [
            UIAlertAction(title: "Close", style: .default, handler: { _ in
                self.source?.navigationController?.popViewController(animated: true)
            })
        ])
    }
}
