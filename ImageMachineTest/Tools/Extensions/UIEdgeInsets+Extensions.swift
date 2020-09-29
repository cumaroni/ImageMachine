//
//  UIEdgeInsets+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    public init(_ size: CGFloat) {
        self.init()
        left = size
        right = size
        top = size
        bottom = size
    }
    
    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.init()
        left = horizontal
        right = horizontal
        top = vertical
        bottom = vertical
    }
    
    public init(horizontal: CGFloat) {
        self.init()
        left = horizontal
        right = horizontal
        top = 0
        bottom = 0
    }
    
    public init(vertical: CGFloat) {
        self.init()
        left = 0
        right = 0
        top = vertical
        bottom = vertical
    }
    
}
