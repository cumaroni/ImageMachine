//
//  String+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension String {
    
    public static func empty(_ value: String?) -> Bool {
        return (value == nil || value!.isEmpty) || (value!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)).count == 0
    }
    
    public func contain(_ str: String) -> Bool {
        return (lowercased().range(of: str) != nil) ? true : false
    } 
}
