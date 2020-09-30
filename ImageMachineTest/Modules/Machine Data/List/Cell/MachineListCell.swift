//
//  MachineListCell.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import RxSwift

final class MachineListCell: UITableViewCell {

    let machineView = UIView()
    let folderImg = UIImageView()
    let nameLbl = UILabel()
    let typeLbl = UILabel()
    
    var disposable = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        machineView.sv([
            folderImg, nameLbl, typeLbl
        ])
        sv([machineView])
        
        setupConstraints()
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposable = DisposeBag()
    }
    
    private func setupCell() {
        machineView.style {
            $0.backgroundColor = .clear
            $0.setLayer(cornerRadius: Margin.s16.autoSize, borderWidth: 0.7, borderColor: .gray)
        }
        
        folderImg.style {
            $0.image = #imageLiteral(resourceName: "ic_folder").transparent
            $0.tintColor = .darkGray
        }
        
        nameLbl.style {
            $0.font = UIFont.boldSystemFont(ofSize: Margin.f18)
            $0.textColor = .darkText
        }
        
        typeLbl.style {
            $0.font = UIFont.systemFont(ofSize: Margin.f14)
            $0.textColor = .lightGray
        }
        
        [nameLbl, typeLbl].style {
            $0.numberOfLines = 2
            $0.textAlignment = .left
        }
    }
    
    private func setupConstraints() {
        machineView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(Margin.s8)
            make.leading.equalTo(contentView).offset(Margin.s12)
            make.trailing.equalTo(contentView).offset(-Margin.s12)
            make.bottom.equalTo(contentView).offset(-Margin.s8)
        }
        
        folderImg.snp.makeConstraints { (make) in
            make.leading.equalTo(machineView).offset(Margin.s16)
            make.size.equalTo(Margin.i35.autoSize)
            make.centerY.equalTo(machineView)
        }
        
        nameLbl.snp.makeConstraints { (make) in
            make.top.equalTo(machineView).offset(Margin.s16)
            make.leading.equalTo(folderImg.snp.trailing).offset(Margin.s16)
            make.trailing.equalTo(machineView).offset(-Margin.s16)
        }
        
        typeLbl.snp.makeConstraints { (make) in
            make.top.equalTo(nameLbl.snp.bottom).offset(Margin.s4)
            make.leading.trailing.equalTo(nameLbl)
            make.bottom.equalTo(machineView).offset(-Margin.s16)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
