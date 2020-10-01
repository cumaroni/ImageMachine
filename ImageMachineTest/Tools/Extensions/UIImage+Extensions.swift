//
//  UIImage+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIImage {
    
    public var transparent: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    } 
}
