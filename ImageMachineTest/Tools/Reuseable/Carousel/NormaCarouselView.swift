//
//  NormaCarouselView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import Foundation
import UIKit

final class NormalCarouselView: UIView {
     
    let closeBtn = UIButton(type: .system)
    let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    let totalLbl = UILabel()
    
    required init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        sv([closeBtn, collectionView, totalLbl])
        
        setupConstraint()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setupText() {
        
    }
    
    func setupView() {
        closeBtn.style {
            $0.setImage(#imageLiteral(resourceName: "ic_close").transparent, for: .normal)
            $0.tintColor = .black
        }
        
        collectionView.style {
            $0.isPagingEnabled = true
            $0.register(NormalCarouselCell.self, forCellWithReuseIdentifier: "cell")
            $0.setupNormalLayout(itemSize: CGSize(width: $0.frame.width, height: $0.frame.height), verticalSpacing: 0, horizontalSpacing: 0, insets: .zero)
            $0.showsHorizontalScrollIndicator = false
        }
        
        totalLbl.style {
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textColor = .black
        }
    }
    
    func setupConstraint() {
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(Margin.s32)
            make.trailing.equalTo(self).offset(-Margin.s16)
            make.size.equalTo(Margin.i25)
        }
        
        totalLbl.snp.makeConstraints { (make) in
            make.centerY.equalTo(closeBtn)
            make.centerX.equalTo(self)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(closeBtn.snp.bottom).offset(Margin.s12)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
