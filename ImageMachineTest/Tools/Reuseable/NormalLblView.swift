//
//  NormalLblView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class NormalLblView: UIView {
     
    private let titleLbl = UILabel()
    let valueLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        sv([titleLbl, valueLbl])
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var value: String? {
        get { return valueLbl.text } set { valueLbl.text = newValue }
    }
    
    func clearText() {
        valueLbl.text = ""
    }
    
    func initialize(_ title: String) {
        titleLbl.text = title
    }
    
    private func setupView() {
        titleLbl.style {
            $0.font = .boldSystemFont(ofSize: Margin.f16)
        }
        
        valueLbl.style {
            $0.font = .systemFont(ofSize: Margin.f16)
        }
        
        [titleLbl, valueLbl].style {
            $0.numberOfLines = 0
            $0.textAlignment = .left
            $0.textColor = .darkText
        }
    }
    
    private func setupConstraints() {
        titleLbl.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalTo(self)
            make.trailing.equalTo(self.snp.centerX).offset(-Margin.s8)
        }
        
        valueLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self.snp.centerX)
            make.trailing.bottom.equalTo(self)
        }
        
        setNeedsLayout()
        layoutIfNeeded() 
    }
    
}
