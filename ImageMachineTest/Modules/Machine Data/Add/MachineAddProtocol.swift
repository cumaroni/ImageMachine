//
//  MachineAddProtocol.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

protocol MachineAddViewControllerDelegate: AnyObject {
    
}//VIEW_CONTROLLER

protocol MachineAddPresenterDelegate: AnyObject {
    
    func viewDidLoad()
    
}//PRESENTER

protocol MachineAddRouterDelegate: AnyObject {
    
}//ROUTER

protocol MachineAddInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineAddInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
