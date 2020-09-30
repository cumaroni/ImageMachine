//
//  MachineListView.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

final class MachineListView: UIView {
    
    let navLbl = UILabel()
    let addBtn = UIButton()
    let lineView = UIView()
    let searchView = UIView()
    let searchImg = UIImageView()
    let searchField = UITextField()
    let sortBtn = UIButton()
    let machineTblView = UITableView()
    let qrView = UIView()
    let qrImg = UIImageView()
    let qrBtn = UIButton()
    
    let emptyLbl = UILabel()
    
    init() {
        super.init(frame: mainScreen)
        backgroundColor = .white
        
        searchView.sv([searchImg, searchField])
        sv([
            navLbl, addBtn,
            lineView,
            searchView, sortBtn,
            machineTblView,
            qrView, qrImg, qrBtn,
            emptyLbl
        ])
        
        setupConstraint()
        setupView()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        navLbl.text = "Machine List"
        searchField.placeholder = "Search by name"
        emptyLbl.text = "There is no any Machine Data"
    }
    
    private func setupView() {
        navLbl.style {
            $0.font = UIFont.boldSystemFont(ofSize: Margin.f25)
            $0.textAlignment = .center
            $0.textColor = .darkText
        }
        
        lineView.style {
            $0.setAsLine(height: 0.5)
        }
        
        addBtn.style {
            $0.setImage(#imageLiteral(resourceName: "ic_add"), for: .normal)
            $0.tintColor = .darkGray
        }
        
        searchView.style {
            $0.backgroundColor = .white
            $0.setLayer(cornerRadius: Margin.s12.autoSize, borderWidth: 0.4, borderColor: .gray)
        }
        
        searchImg.style {
            $0.image = #imageLiteral(resourceName: "ic_search").transparent
            $0.tintColor = .gray
        }
        
        searchField.style {
            $0.autocorrectionType = .no
            $0.font = .systemFont(ofSize: Margin.f16)
            $0.textColor = .darkText
            $0.tintColor = .darkText
        }
        
        sortBtn.style {
            $0.setImage(#imageLiteral(resourceName: "ic_sort").transparent, for: .normal)
            $0.tintColor = .darkGray
        }
        
        machineTblView.style {
            $0.backgroundColor = .clear
            $0.bounces = false
            $0.flexibleHeight()
            $0.register(MachineListCell.self, forCellReuseIdentifier: "cell")
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
        
        qrView.style {
            $0.backgroundColor = .white
            $0.setLayer(cornerRadius: 0, borderWidth: 0, borderColor: .clear)
            $0.setShadow()
        }
        
        qrImg.style {
            $0.image = #imageLiteral(resourceName: "ic_qr").transparent
            $0.tintColor = .black
        }
        
        emptyLbl.style {
            $0.font = UIFont.systemFont(ofSize: Margin.f16, weight: .medium)
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.textColor = .darkGray
        }
        
    }
    
    private func setupConstraint() {
        navLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(safeInset().top + Margin.s16)
            make.leading.equalTo(self).offset(Margin.s16)
            make.trailing.equalTo(self).offset(-Margin.s16)
        }
        
        addBtn.snp.makeConstraints { (make) in
            make.centerY.trailing.equalTo(navLbl)
            make.size.equalTo(Margin.i25.autoSize)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(navLbl.snp.bottom).offset(Margin.s16)
            make.leading.trailing.equalTo(self)
        }
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(Margin.s12)
            make.leading.equalTo(navLbl)
            make.trailing.equalTo(sortBtn.snp.leading).offset(-Margin.s12)
            make.height.equalTo(Margin.h40.autoSize)
        }
        
        searchImg.snp.makeConstraints { (make) in
            make.leading.equalTo(searchView).offset(Margin.s16)
            make.size.equalTo(Margin.i20.autoSize)
            make.centerY.equalTo(searchView)
        }
        
        searchField.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(searchView)
            make.leading.equalTo(searchImg.snp.trailing).offset(Margin.s12)
            make.trailing.equalTo(searchView).offset(-Margin.s16)
        }
        
        sortBtn.snp.makeConstraints { (make) in
            make.trailing.equalTo(addBtn)
            make.size.equalTo(Margin.i20.autoSize)
            make.centerY.equalTo(searchView)
        }
        
        machineTblView.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        qrView.snp.makeConstraints { (make) in
            make.trailing.bottom.equalTo(self).offset(-Margin.s24)
            make.size.equalTo(Margin.i70.autoSize)
        }
        
        qrImg.snp.makeConstraints { (make) in
            make.center.equalTo(qrView)
            make.size.equalTo(Margin.i25.autoSize)
        }
        
        qrBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(qrView)
        }
        
        emptyLbl.snp.makeConstraints { (make) in
            make.center.equalTo(machineTblView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
     
}
