//
//  MachineAddView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineAddView: UIView {
    
    let navLbl = UILabel()
    let addBtn = UIButton()
    let lineView = UIView()
    let searchView = UIView()
    let searchImg = UIImageView()
    let searchField = UITextField()
    let filterBtn = UIButton()
    let machineTblView = UITableView()
    let qrView = UIView()
    let qrImg = UIImageView()
    let qrBtn = UIButton()
    
    let emptyLbl = UILabel()
    
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        
        setupConstraint()
        setupView()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        
    }
    
    private func setupView() {
        
    }
    
    private func setupConstraint() {
        
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}

