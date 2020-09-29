//
//  MachineAddPresenter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import Foundation

final class MachineAddPresenter {
    weak var view: MachineAddViewControllerDelegate?
    lazy var router: MachineAddRouterDelegate = MachineAddRouter(view: view)
    lazy var interactor: MachineAddInteractorInputDelegate = MachineAddInteractor(presenter: self)
    
    init(view: MachineAddViewControllerDelegate?) {
        self.view = view
    }
    
}//MAIN

extension MachineAddPresenter: MachineAddPresenterDelegate {
    
    func viewDidLoad() {
        
    }
    
}//DELEGATE

extension MachineAddPresenter: MachineAddInteractorOutputDelegate {
    
}//INTERACTOR
