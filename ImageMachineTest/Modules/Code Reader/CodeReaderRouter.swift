//
//  CodeReaderRouter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class CodeReaderRouter: CodeReaderRouterDelegate {
    weak var source: UIViewController?
    
    init(view: CodeReaderViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToMachineDetail(_ model: MachineRealmModel) {
        let detailVc = MachineDetailController()
        detailVc.setMachineDetailData(model)
        source?.navigationController?.pushViewController(detailVc, animated: true)
    }
}
