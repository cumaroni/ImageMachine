//
//  MachineListView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineListView: UIView {
    
    
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
