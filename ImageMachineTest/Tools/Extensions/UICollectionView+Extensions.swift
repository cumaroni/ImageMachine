//
//  UICollectionView+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

extension UICollectionView {
    
    public var currentPosition: Int {
        return Int(contentOffset.x / frame.size.width)
    }
    
    public func setupNormalLayout(
        itemSize: CGSize,
        verticalSpacing vSpacing: CGFloat,
        horizontalSpacing hSpacing: CGFloat,
        insets: UIEdgeInsets,
        collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        
        // Horizontal Flow
        let layout = collectionViewLayout
        layout.scrollDirection = .horizontal
        layout.sectionInset = insets
        layout.minimumLineSpacing = vSpacing
        layout.minimumInteritemSpacing = hSpacing
        layout.itemSize = itemSize
        setCollectionViewLayout(layout, animated: true)
    }
    
    public func setupNormalLayout(
        numberOfItemsInRow totalItemsAtRow: CGFloat,
        itemHeightRatio heightRatio: CGFloat,
        verticalSpacing vSpacing: CGFloat,
        horizontalSpacing hSpacing: CGFloat,
        collectionViewWidth _width: CGFloat? = nil,
        insets: UIEdgeInsets = UIEdgeInsets(0),
        collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        
        // Vertical Flow
        let layout = collectionViewLayout
        layout.sectionInset = insets
        layout.minimumLineSpacing = vSpacing
        layout.minimumInteritemSpacing = hSpacing
        layout.estimatedItemSize = .zero
        
        setNeedsLayout()
        layoutIfNeeded()
        // substract the edges of collectionView
        var width = _width ?? frame.size.width - insets.left - insets.right
        // substract the spacing between two items
        width -= ((totalItemsAtRow - 1) * hSpacing)
        // divide the width by total items in a row
        width /= totalItemsAtRow
        let height = (width * heightRatio)
        
        layout.itemSize = CGSize(
            width: width.rounded(.down),
            height: height
        )
        setCollectionViewLayout(layout, animated: true)
    }
    
    public func updateHeight(numberOfItemsInRow totalItem: CGFloat = 1, totalData: Int) {
        let total = CGFloat(totalData)
        let layout = (collectionViewLayout as! UICollectionViewFlowLayout)
        let height = layout.itemSize.height
        let totaldata = total / totalItem
        snp.updateConstraints { (make) in
            let value = Double(totaldata).rounded(.up)
            var items = CGFloat(value) * height + 8
            items += layout.sectionInset.top + layout.sectionInset.bottom + (layout.sectionInset.bottom / 2)
            items += (layout.minimumLineSpacing * (totaldata - 1))
            make.height.equalTo(items)
        }
    }
    
    func register(cells: [String: AnyClass?]) {
        for (key, value) in cells {
            register(value, forCellWithReuseIdentifier: key)
        }
    }
     
}
