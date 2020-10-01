//
//  UITableView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

extension UITableView { 
    
    public func flexibleHeight() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 44
    } 
    
    func register(cells: [String: AnyClass?]) {
        for (key, value) in cells {
            register(value, forCellReuseIdentifier: key)
        }
    }
    
}
