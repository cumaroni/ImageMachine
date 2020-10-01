//
//  CodeReaderInteractor.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class CodeReaderInteractor {
    weak var presenter: CodeReaderInteractorOutputDelegate?
    
    init(presenter: CodeReaderInteractorOutputDelegate?) {
        self.presenter = presenter
    }
    
}//MAIN

extension CodeReaderInteractor: CodeReaderInteractorInputDelegate {
    
}//DELEGATE


extension CodeReaderInteractor: CodeReaderInteractorOutputDelegate {
    
}//DATA_MANAGER
