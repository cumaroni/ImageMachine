//
//  MachineDetailProtocol.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

protocol MachineDetailViewControllerDelegate: AnyObject {
    
}//VIEW_CONTROLLER

protocol MachineDetailPresenterDelegate: AnyObject {
    
    func viewDidLoad()
    
    func presentCarouselView(_ data: [UIImage], _ index: Int)
    
    func pushToMachineEdit(_ data: MachineRealmModel)
    
}//PRESENTER

protocol MachineDetailRouterDelegate: AnyObject {
    
    func presentCarouselView(_ data: [UIImage], _ index: Int)
    
    func pushToMachineEdit(_ data: MachineRealmModel)
    
}//ROUTER

protocol MachineDetailInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineDetailInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
