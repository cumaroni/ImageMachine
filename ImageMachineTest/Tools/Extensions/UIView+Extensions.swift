//
//  UIView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }
    
    public func setAsLine(height: Float = 1) {
        self.snp.makeConstraints { (make) in
            make.height.equalTo(height)
        }
        backgroundColor = .lightGray
    }
    
    public func setLayer(cornerRadius: CGFloat? = nil, borderWidth width: CGFloat? = nil, borderColor color: UIColor? = nil) {
        setNeedsLayout()
        layoutIfNeeded()
        if let radius = cornerRadius {
            let size = (frame.width == 0 ? frame.height : frame.width) / 2
            layer.cornerRadius = (radius == 0 ? size : radius)
        } else {
            layer.cornerRadius = 0
        }
        
        if let width = width {
            layer.borderWidth = width
        }
        if let color = color {
            layer.borderColor = color.cgColor
        }
        layer.masksToBounds = true
    }
    
    public func setShadow(offset: CGSize = CGSize(0), radius: CGFloat = 2, opacity: Float = 0.4, color: UIColor = .darkGray) { 
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
     
    
    @discardableResult
    public func sv(_ subViews: UIView...) -> UIView {
        return sv(subViews)
    }
    
    @objc @discardableResult
    public func sv(_ subViews: [UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
}
