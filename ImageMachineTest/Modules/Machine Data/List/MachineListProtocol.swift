//
//  MachineListProtocol.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

protocol MachineListViewControllerDelegate: AnyObject {
    
}//VIEW_CONTROLLER

protocol MachineListPresenterDelegate: AnyObject {
    
    func viewDidLoad()
    
}//PRESENTER

protocol MachineListRouterDelegate: AnyObject {
    
}//ROUTER

protocol MachineListInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineListInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
