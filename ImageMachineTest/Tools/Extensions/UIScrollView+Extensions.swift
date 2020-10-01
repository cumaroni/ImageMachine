//
//  UIScrollView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    public var currentIndex: Int {
        return Int(contentOffset.x / frame.size.width)
    }
}
