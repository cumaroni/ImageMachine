//
//  UICollectionViewCell+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

extension UICollectionViewCell {
    
    @discardableResult
    public override func sv(_ subViews: [UIView]) -> UIView {
        contentView.snp.makeConstraints { (make) in
            make.edges.width.equalTo(self)
        }
        return contentView.sv(subViews)
    }
}
