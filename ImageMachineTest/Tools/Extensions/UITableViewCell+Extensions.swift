//
//  UITableViewCell+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    @discardableResult
    public override func sv(_ subViews: [UIView]) -> UIView {
        contentView.snp.makeConstraints { (make) in
            make.edges.width.equalTo(self)
        }
        return contentView.sv(subViews)
    }
}
