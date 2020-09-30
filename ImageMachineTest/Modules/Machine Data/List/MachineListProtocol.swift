//
//  MachineListProtocol.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

protocol MachineListViewControllerDelegate: AnyObject {
    
    func sortMachineData(_ isByName: Bool)
    
}//VIEW_CONTROLLER

protocol MachineListPresenterDelegate: AnyObject {
    
    func viewDidLoad()
    
    func pushToMachineAdd()
    
    func pushToMachineDetail(_ model: MachineRealmModel)
    
    func presentSortAlert()
    
}//PRESENTER

protocol MachineListRouterDelegate: AnyObject {
    
    func pushToMachineAdd()
    
    func pushToMachineDetail(_ model: MachineRealmModel)
    
    func presentSortAlert(_ isSorted: @escaping (Bool) -> Void) 
    
}//ROUTER

protocol MachineListInteractorInputDelegate: AnyObject {
     
}//INTERACTOR_INPUT

protocol MachineListInteractorOutputDelegate: AnyObject {
    
}//INTERACTOR_OUTPUT
