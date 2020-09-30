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
    
    func presentErrorAlert(_ message: String)
    
    func presentSuccessAlert()
    
}//PRESENTER

protocol MachineAddRouterDelegate: AnyObject {
    
    func presentErrorAlert(_ message: String)
    
    func presentSuccessAlert()
    
}//ROUTER

protocol MachineAddInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineAddInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
