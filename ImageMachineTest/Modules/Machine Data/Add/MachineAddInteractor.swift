//
//  MachineAddInteractor.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineAddInteractor {
    weak var presenter: MachineAddInteractorOutputDelegate?
    
    init(presenter: MachineAddInteractorOutputDelegate?) {
        self.presenter = presenter
    }
    
}//MAIN

extension MachineAddInteractor: MachineAddInteractorInputDelegate {
    
}//DELEGATE


extension MachineAddInteractor: MachineAddInteractorOutputDelegate {
    
}//DATA_MANAGER
