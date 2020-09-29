//
//  Array+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

extension Array where Element: UIView {
    
    func style(_ callback: ((Element)->Void)) {
        for item in self {
            callback(item)
        }
    }
}


extension Array where Element: UIBarItem {
    
    func style(_ callback: ((Element)->Void)) {
        for item in self {
            callback(item)
        }
    }
    
}

extension Array where Element: UIGestureRecognizer {
    
    func style(_ callback: ((Element)->Void)) {
        for item in self {
            callback(item)
        }
    }
    
}
