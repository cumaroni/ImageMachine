//
//  UIStackView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

extension UIStackView {
    
    public func setupArrangedSubview(_ views: [UIView]) {
        for item in views {
            addArrangedSubview(item)
        }
    }
}
