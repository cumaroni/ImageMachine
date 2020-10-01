//
//  MachineListPresenter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import Foundation

final class MachineListPresenter {
    weak var view: MachineListViewControllerDelegate?
    lazy var router: MachineListRouterDelegate = MachineListRouter(view: view)
    lazy var interactor: MachineListInteractorInputDelegate = MachineListInteractor(presenter: self)
    
    init(view: MachineListViewControllerDelegate?) {
        self.view = view
    }
    
}//MAIN

extension MachineListPresenter: MachineListPresenterDelegate {
    
    func viewDidLoad() {
        
    }
    
    func pushToMachineAdd() {
        router.pushToMachineAdd()
    }
    
    func pushToMachineDetail(_ model: MachineRealmModel) {
        router.pushToMachineDetail(model)
    }
    
    func pushToCodeReader() {
        router.pushToCodeReader()
    }
    
    func presentSortAlert() {
        router.presentSortAlert { sorted in
            self.view?.sortMachineData(sorted)
        }
    }
    
}//DELEGATE

extension MachineListPresenter: MachineListInteractorOutputDelegate {
    
}//INTERACTOR
