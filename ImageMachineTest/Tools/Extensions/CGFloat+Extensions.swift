//
//  CGFloat+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension CGFloat {
    
    var autoSize: CGFloat {
        switch UIDevice.current.deviceTypeHeight {
        case .iPhone4_4S, .iPhones_5_5s_5c_SE, .iPhones_6_6s_7_8, .iPhone11Pro_X_XS:
            return (self / 375) * mainScreen.width
        case .iPhones_6Plus_6sPlus_7Plus_8Plus, .iPhone11_XR, .iPhone11ProMax_XSMax:
            return (self / 414) * mainScreen.width
        default:
            return (self / 414) * mainScreen.width
        }
    } 
}
