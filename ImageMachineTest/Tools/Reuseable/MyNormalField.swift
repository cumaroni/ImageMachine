//
//  MyNormalField.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MyNormalField: UIView {
    
    private let titleLbl = UILabel()
    private let requiredLbl = UILabel()
    private let normalView = UIView()
    let valueField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        normalView.sv([valueField])
        sv([titleLbl, requiredLbl, normalView])
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var value: String? {
        get { return valueField.text } set { valueField.text = newValue }
    }
    
    func clearText() {
        valueField.text = ""
    }
    
    func initialize(_ title: String, _ placeholder: String, keyboard: UIKeyboardType, isRequired: Bool) {
        titleLbl.text = title
        valueField.placeholder = placeholder
        valueField.keyboardType = keyboard
        requiredLbl.isHidden = !isRequired
    }
    
    private func setupView() {
        titleLbl.style {
            $0.font = .boldSystemFont(ofSize: Margin.f16)
            $0.textAlignment = .left
            $0.textColor = .white
        }
        
        requiredLbl.style {
            $0.font = .systemFont(ofSize: Margin.f20, weight: .semibold)
            $0.textAlignment = .left
            $0.textColor = .systemRed
            $0.text = "*"
        }
        
        normalView.style {
            $0.backgroundColor = .white
            $0.setLayer(cornerRadius: Margin.s8, borderWidth: 0.6, borderColor: .lightGray)
        }
        
        valueField.style {
            $0.autocorrectionType = .no
            $0.autocapitalizationType = .sentences
            $0.font = .systemFont(ofSize: Margin.f16)
            $0.tintColor = .darkText
            $0.returnKeyType = .next
        }
    }
    
    private func setupConstraints() {
        titleLbl.snp.makeConstraints { (make) in
            make.top.leading.equalTo(self)
        }
        
        requiredLbl.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLbl)
            make.leading.equalTo(titleLbl.snp.trailing).offset(Margin.s8)
        }
        
        normalView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLbl.snp.bottom).offset(Margin.s8)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        valueField.snp.makeConstraints { (make) in
            make.top.leading.equalTo(normalView).offset(Margin.s12)
            make.trailing.bottom.equalTo(normalView).offset(-Margin.s12)
        }
        
    }
    
}
