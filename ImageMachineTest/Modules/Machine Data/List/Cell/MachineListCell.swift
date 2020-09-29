//
//  MachineListCell.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import RxSwift

final class MachineListCell: UITableViewCell {
    
    var disposable = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
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
        
    }
    
    private func setupConstraints() {
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
