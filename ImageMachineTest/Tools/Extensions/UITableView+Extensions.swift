//
//  UITableView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

extension UITableView {
    
    func changeTblFromBottomToTop() {
        let numRows = self.numberOfRows(inSection: 0)
        var contentInsetTop = CGFloat(16)
        for i in 0..<numRows {
            let rowRect = self.rectForRow(at: IndexPath(item: i, section: 0))
            contentInsetTop -= rowRect.size.height
            if contentInsetTop <= 0 {
                contentInsetTop = 0
            }
        }
        self.contentInset = UIEdgeInsets(top: contentInsetTop, left: 0, bottom: 0, right: 0)
    }
    
    public func flexibleHeight() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 44
    } 
    
    func register(cells: [String: AnyClass?]) {
        for (key, value) in cells {
            register(value, forCellReuseIdentifier: key)
        }
    }
    
    func tableViewScrollToBottom(animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                self.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: animated)
            }
        }
    }
    
}
