//
//  MachineDetailCell.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

class MachineDetailCell: UICollectionViewCell {
    
    let machineImg = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        sv([machineImg])
        
        setupConstraint()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        machineImg.style {
            $0.clipsToBounds = true
            $0.setLayer(cornerRadius: Margin.s8.autoSize, borderWidth: 0, borderColor: .clear)
        }
    }
    
    private func setupConstraint() {
        machineImg.snp.makeConstraints { (make) in
            make.top.leading.equalTo(contentView).offset(Margin.s8)
            make.trailing.bottom.equalTo(contentView).offset(-Margin.s8)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
