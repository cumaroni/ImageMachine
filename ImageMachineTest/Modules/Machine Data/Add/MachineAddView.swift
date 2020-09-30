//
//  MachineAddView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineAddView: UIView {
    
    let backBtn = NormalBackBtn(title: "Back")
    let navLbl = UILabel()
    let lineView = UIView()
    let stackView = UIStackView()
    let nameField = NormalTextField()
    let typeField = NormalTextField()
    let qrCodeField = NormalTextField()
    let addBtn = UIButton()
    
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        stackView.setupArrangedSubview([
            nameField,
            typeField,
            qrCodeField
        ])
        sv([
            backBtn, navLbl,
            lineView,
            stackView,
            addBtn
        ])
        
        setupConstraint()
        setupView()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        navLbl.text = "Add Machine Data"
        nameField.initialize("Machine Name", "Name of your machine", keyboard: .default, isRequired: true)
        typeField.initialize("Machine Type", "Type of you machine", keyboard: .default, isRequired: true)
        qrCodeField.initialize("QR Code Number", "Must have more than 6 number", keyboard: .numberPad, isRequired: true)
        addBtn.setTitle("ADD", for: .normal)
    }
    
    private func setupView() {
        navLbl.style {
            $0.font = UIFont.boldSystemFont(ofSize: Margin.f30)
            $0.textAlignment = .left
            $0.textColor = .darkText
        }
        
        lineView.style {
            $0.setAsLine(height: 0.5)
        }
        
        addBtn.style {
            $0.backgroundColor = .black
            $0.setLayer(cornerRadius: Margin.s8.autoSize)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: Margin.f18)
        }
        
        stackView.style {
            $0.alignment = .fill
            $0.axis = .vertical
            $0.spacing = Margin.s16
        }
    }
    
    private func setupConstraint() {
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(safeInset().top + Margin.s16)
            make.leading.equalTo(self).offset(Margin.s12)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn.snp.bottom).offset(Margin.s16)
            make.leading.trailing.equalTo(self)
        }
        
        navLbl.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(Margin.s16)
            make.leading.equalTo(self).offset(Margin.s8)
            make.trailing.equalTo(self).offset(-Margin.s16)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(navLbl.snp.bottom).offset(Margin.s24)
            make.leading.equalTo(self).offset(Margin.s16)
            make.trailing.equalTo(self).offset(-Margin.s16)
        }
        
        addBtn.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(Margin.s24)
            make.leading.trailing.equalTo(stackView)
            make.height.equalTo(Margin.h42.autoSize)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}

