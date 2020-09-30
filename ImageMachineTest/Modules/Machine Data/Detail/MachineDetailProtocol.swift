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
    
}//PRESENTER

protocol MachineDetailRouterDelegate: AnyObject {
    
}//ROUTER

protocol MachineDetailInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineDetailInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
