//
//  MachineDetailController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import RxDataSources

class MachineDetailController: UIViewController {
    lazy var root = MachineDetailView()
    lazy var presenter: MachineDetailPresenterDelegate = MachineDetailPresenter(view: self)
    
    var disposable = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        presenter.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        binding()
    }
    
    private func binding() {
        bindMachineImgBtn()
    }
    
    private func bindMachineImgBtn() {
        func machineImgBtnPressed() {
        }
        root.machineImgBtn.rx.tap.subscribe(onNext: machineImgBtnPressed).disposed(by: disposable)
    }
    
}

extension MachineDetailController: MachineDetailViewControllerDelegate {
    
    func setMachineDetailData(_ model: MachineRealmModel) {
        root.idLbl.value = ": \(model.id)"
        root.nameLbl.value = ": \(model.name)"
        root.typeLbl.value = ": \(model.type)"
        root.qrLbl.value = ": \(model.qrNumber)"
        root.dateLbl.value = ": \(model.date)"
    }
}
