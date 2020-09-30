//
//  MachineDetailInteractor.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineDetailInteractor {
    weak var presenter: MachineDetailInteractorOutputDelegate?
    
    init(presenter: MachineDetailInteractorOutputDelegate?) {
        self.presenter = presenter
    }
    
}//MAIN

extension MachineDetailInteractor: MachineDetailInteractorInputDelegate {
    
}//DELEGATE


extension MachineDetailInteractor: MachineDetailInteractorOutputDelegate {
    
}//DATA_MANAGER
