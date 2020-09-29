//
//  MachineListInteractor.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineListInteractor {
    weak var presenter: MachineListInteractorOutputDelegate?
    
    init(presenter: MachineListInteractorOutputDelegate?) {
        self.presenter = presenter
    }
    
}//MAIN

extension MachineListInteractor: MachineListInteractorInputDelegate {
    
}//DELEGATE


extension MachineListInteractor: MachineListInteractorOutputDelegate {
    
}//DATA_MANAGER
