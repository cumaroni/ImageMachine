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
    let moreBtn = UIButton()
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
    
    let machineImgLbl = UILabel()
    let machineImgBtn = UIButton()
    
    let imgCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
      
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        stackView.setupArrangedSubview([
            idLbl,
            nameLbl,
            typeLbl,
            qrLbl,
            dateLbl,
        ])
        contentView.sv([stackView, machineImgLbl, imgCollectionView])
        scrollView.sv([contentView])
        sv([backBtn, moreBtn, navLbl, lineView, scrollView, machineImgBtn])
        
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
        machineImgLbl.text = "Machine Image"
        machineImgBtn.setTitle("Add", for: .normal)
    }
    
    private func setupView() {
        moreBtn.style {
            $0.setImage(#imageLiteral(resourceName: "ic_more").transparent, for: .normal)
            $0.tintColor = .black
        }
        
        [navLbl, machineImgLbl].style {
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
        
        machineImgBtn.style {
            $0.backgroundColor = .black
            $0.contentEdgeInsets = UIEdgeInsets(horizontal: Margin.s8, vertical: Margin.s4)
            $0.setLayer(cornerRadius: Margin.s8.autoSize)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: Margin.f16)
        }
        
        imgCollectionView.style {
            $0.backgroundColor = .white
            $0.bounces = false
            $0.register(MachineDetailCell.self, forCellWithReuseIdentifier: "cell")
            $0.setupNormalLayout(numberOfItemsInRow: 3, itemHeightRatio: 1, verticalSpacing: 0, horizontalSpacing: 0)
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        
    }
    
    private func setupConstraint() {
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(safeInset().top + Margin.s16)
            make.leading.equalTo(self).offset(Margin.s12)
            make.size.equalTo(Margin.i20.autoSize)
        }
        
        moreBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(backBtn)
            make.trailing.equalTo(self).offset(-Margin.s12)
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
            make.trailing.equalTo(contentView).offset(-Margin.s12)
        }
        
        machineImgLbl.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(Margin.s24)
            make.leading.equalTo(navLbl)
        }
        
        machineImgBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(machineImgLbl)
            make.leading.equalTo(machineImgLbl.snp.trailing).offset(Margin.s8)
        }
        
        imgCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(machineImgLbl.snp.bottom).offset(Margin.s8)
            make.leading.trailing.bottom.equalTo(contentView)
            make.height.equalTo(mainScreen.height / 2)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}
