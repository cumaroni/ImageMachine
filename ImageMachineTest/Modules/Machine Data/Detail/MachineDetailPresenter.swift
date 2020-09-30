//
//  MachineDetailPresenter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import Foundation

final class MachineDetailPresenter {
    weak var view: MachineDetailViewControllerDelegate?
    lazy var router: MachineDetailRouterDelegate = MachineDetailRouter(view: view)
    lazy var interactor: MachineDetailInteractorInputDelegate = MachineDetailInteractor(presenter: self)
    
    init(view: MachineDetailViewControllerDelegate?) {
        self.view = view
    }
    
}//MAIN

extension MachineDetailPresenter: MachineDetailPresenterDelegate {
    
    func viewDidLoad() {
        
    }
    
}//DELEGATE

extension MachineDetailPresenter: MachineDetailInteractorOutputDelegate {
    
}//INTERACTOR
