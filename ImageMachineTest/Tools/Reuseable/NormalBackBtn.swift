//
//  NormalBackBtn.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import RxDataSources

final class NormalBackBtn: UIView {
     
    private let backImg = UIImageView()
    private let titleLbl = UILabel()
    private let backBtn = UIButton()
    
    private var disposable = DisposeBag()
    private var textTitle: String = "View"
    private var textColor: UIColor = .black
    
    init(title: String = "View", titleColor: UIColor = .black) {
        super.init(frame: CGRect())
         
        sv([backImg, titleLbl, backBtn])
         
        textTitle = title
        textColor = titleColor
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backImg.style {
            $0.image = #imageLiteral(resourceName: "ic_back")
            $0.tintColor = textColor
        }
        
        titleLbl.style {
            $0.font = UIFont.systemFont(ofSize: Margin.f20, weight: .semibold)
            $0.text = textTitle
            $0.textColor = textColor
            $0.textAlignment = .center
        }
        
        backBtn.style {
            $0.rx.tap.subscribe(onNext: pop).disposed(by: disposable)
        }
    }
    
    func setTitle(_ title: String) {
        titleLbl.text = title
    }
    
    func pop() {
        BaseSource.navbar?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        backImg.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalTo(self)
            make.size.equalTo(Margin.i20.autoSize)
        }
        
        titleLbl.snp.makeConstraints { (make) in
            make.centerY.equalTo(backImg)
            make.leading.equalTo(backImg.snp.trailing).offset(Margin.s4)
            make.trailing.equalTo(self)
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
