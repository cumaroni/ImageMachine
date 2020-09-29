//
//  UIAppearance+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIAppearance {
    
    @discardableResult
    public func style(_ styleClosure: (Self) -> Void) -> Self {
        styleClosure(self)
        return self
    }
}
