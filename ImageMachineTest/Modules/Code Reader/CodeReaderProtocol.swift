//
//  CodeReaderProtocol.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

protocol CodeReaderViewControllerDelegate: AnyObject {
    
}//VIEW_CONTROLLER

protocol CodeReaderPresenterDelegate: AnyObject {
    
    func viewDidLoad()
    
    func pushToMachineDetail(_ model: MachineRealmModel)
    
}//PRESENTER

protocol CodeReaderRouterDelegate: AnyObject {
    
    func pushToMachineDetail(_ model: MachineRealmModel)
    
}//ROUTER

protocol CodeReaderInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol CodeReaderInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
