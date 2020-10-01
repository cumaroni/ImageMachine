//
//  CodeReaderPresenter.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import Foundation

final class CodeReaderPresenter {
    weak var view: CodeReaderViewControllerDelegate?
    lazy var router: CodeReaderRouterDelegate = CodeReaderRouter(view: view)
    lazy var interactor: CodeReaderInteractorInputDelegate = CodeReaderInteractor(presenter: self)
    
    init(view: CodeReaderViewControllerDelegate?) {
        self.view = view
    }
    
}//MAIN

extension CodeReaderPresenter: CodeReaderPresenterDelegate {
    
    func viewDidLoad() {
        
    }
    
    func pushToMachineDetail(_ model: MachineRealmModel) {
        router.pushToMachineDetail(model)
    }
    
}//DELEGATE

extension CodeReaderPresenter: CodeReaderInteractorOutputDelegate {
    
}//INTERACTOR
