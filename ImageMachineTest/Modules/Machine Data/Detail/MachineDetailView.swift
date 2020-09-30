//
//  MachineDetailView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineDetailView: UIView {
    
    let backBtn = NormalBackBtn(title: "Back")
    let navLbl = UILabel()
    let lineView = UIView()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView = UIStackView()
    let idLbl = NormalLblView()
    let nameLbl = NormalLblView()
    let typeLbl = NormalLblView()
    let qrLbl = NormalLblView()
    let dateLbl = NormalLblView()
      
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        stackView.setupArrangedSubview([
            idLbl,
            nameLbl,
            typeLbl,
            qrLbl,
            dateLbl
        ])
        contentView.sv([stackView])
        scrollView.sv([contentView])
        sv([backBtn, navLbl, lineView, scrollView])
        
        setupConstraint()
        setupView()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        navLbl.text = "Machine Data Detail"
        idLbl.initialize("Machine Id")
        nameLbl.initialize("Machine Name")
        typeLbl.initialize("Machine Type")
        qrLbl.initialize("Machine QR Code Number")
        dateLbl.initialize("Last Maintenance Date")
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
        
        scrollView.style {
            $0.bounces = false
            $0.showsVerticalScrollIndicator = false
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
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(navLbl.snp.bottom).offset(Margin.s8)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.width.equalTo(scrollView)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(contentView).offset(Margin.s12)
            make.trailing.bottom.equalTo(contentView).offset(-Margin.s12)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}
