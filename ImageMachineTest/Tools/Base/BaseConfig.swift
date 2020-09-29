//
//  BaseConfig.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift

class BaseConfig {
    
    class func initialize() {
        BaseSource.enableConstraintLogging(false)
        BaseSource.enableDebugLogging(true)
        BaseSource.enableParametersLogging(true)
        BaseSource.enableRestApiLogging(true)
        BaseSource.setupFontSize()
    }
}
