//
//  NormalCarouselController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit
import RxSwift
import RxRelay

public class NormalCarouselController: UIViewController {
    
    lazy var root = NormalCarouselView()
    
    var data = BehaviorRelay<[UIImage]>(value: [])
    var currentIndex: Int = 0
    var prevIndex: Int = -1
    
    var disposable: DisposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view = root
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        binding()
    }
    
    func setCarouselData(_ data: [UIImage], _ currentIndex: Int) {
        self.data.accept(data)
        self.currentIndex = currentIndex
    }
    
    private func binding() {
        bindCarouselCollection()
        bindCloseBtn()
        bindCarouselScroll()
    }
    
    private func bindCloseBtn() {
        func closeBtnPressed() {
            self.dismiss(animated: true, completion: nil)
        }
        root.closeBtn.rx.tap.subscribe(onNext: closeBtnPressed).disposed(by: disposable)
    }
    
    private func bindCarouselScroll() {
        func didScroll() {
            currentIndex = root.collectionView.currentIndex
            guard currentIndex != self.prevIndex else { return }
            root.totalLbl.text = "\(currentIndex + 1) / \(self.data.value.count)"
        }
        root.collectionView.rx.didScroll.subscribe(onNext: didScroll).disposed(by: disposable)
    }
    
    private func bindCarouselCollection() {
        debug(data.value)
        data.asObservable().bind(to: root.collectionView.rx.items(cellIdentifier: "cell")) { (index, model, cell: NormalCarouselCell) in
            cell.carouselImg.image = model
        }.disposed(by: disposable)
        
        root.collectionView.reloadData()
        root.collectionView.layoutIfNeeded()
        root.collectionView.setContentOffset(CGPoint(x: CGFloat(currentIndex) * mainScreen.width, y: 0), animated: true)
        root.totalLbl.text = "\(currentIndex + 1) / \(data.value.count)"
    }
}
