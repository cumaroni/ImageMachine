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
    
    func presentCarouselView(_ data: [UIImage], _ index: Int) {
        let carouselVc = NormalCarouselController()
        carouselVc.modalPresentationStyle = .popover
        carouselVc.setCarouselData(data, index)
        source?.navigationController?.present(carouselVc, animated: true, completion: nil)
    }
    
    func pushToMachineEdit(_ data: MachineRealmModel) {
        let editVc = MachineAddController()
        editVc.updateData(data)
        source?.navigationController?.pushViewController(editVc, animated: true)
    }
}
