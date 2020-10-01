//
//  CodeReaderView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class CodeReaderView: UIView {
    
    let backBtn = NormalBackBtn(title: "Back")
    let navLbl = UILabel()
    let lineView = UIView()
    
    let scannerView = UIView()
    let scannerLbl = UILabel()
      
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        sv([
            backBtn,
            navLbl,
            lineView,
            scannerView,
            scannerLbl
        ])
        
        setupConstraint()
        setupView()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        navLbl.text = "Code Reader"
        scannerLbl.text = "You can only scan qr code which contain qr code number from Image Machine"
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
        
        scannerView.style {
            $0.setLayer(cornerRadius: 1)
            $0.backgroundColor = .black
            $0.clipsToBounds = true
        }
        
        scannerLbl.style {
            $0.textColor = .darkGray
            $0.text = "Scan QR Code yang sudah di generate oleh dosen yang sedang mengajar"
            $0.font = UIFont.systemFont(ofSize: Margin.f14, weight: .regular)
            $0.numberOfLines = 0
            $0.textAlignment = .center
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
        
        scannerView.snp.makeConstraints { (make) in
            make.top.equalTo(navLbl.snp.bottom).offset(Margin.s16)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(mainScreen.height / 2)
        }
        
        scannerLbl.snp.makeConstraints { (make) in
            make.top.equalTo(scannerView.snp.bottom).offset(Margin.s8)
            make.leading.equalTo(self).offset(Margin.s16)
            make.trailing.equalTo(self).offset(-Margin.s16)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}
