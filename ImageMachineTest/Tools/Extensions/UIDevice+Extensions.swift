//
//  UIDevice+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIDevice {
    var deviceTypeHeight: DeviceTypeEn {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhone11Pro_X_XS
        case 1792:
            return .iPhone11_XR
        case 2688:
            return .iPhone11ProMax_XSMax
        default:
            return .unknown
        }
    }
}
