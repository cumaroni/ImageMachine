//
//  NormalCarouselCell.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit
import RxSwift

final class NormalCarouselCell: UICollectionViewCell {
     
    let carouselImg = UIImageView()
    
    var disposable: DisposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
         
        sv([carouselImg])
        
        setupConstraint()
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposable = DisposeBag()
    }
    
    private func setupCell() {
        carouselImg.style {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setupConstraint() {
        carouselImg.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
    }
    
}
