//
//  MachineListController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import RxRelay

class MachineListController: UIViewController {
    lazy var root = MachineListView()
    lazy var presenter: MachineListPresenterDelegate = MachineListPresenter(view: self)
     
    var disposable = DisposeBag()
    
    var machineData = BehaviorRelay<[MachineRealmModel]>(value: [])
    var data: [MachineRealmModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        presenter.viewDidLoad()
        setupViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupViewController() {
        binding()
    }
    
    private func binding() {
        bindAddBtn()
        bindSearchField()
        bindFilterBtn()
        bindMachineTblView()
        bindQRBtn()
    }
    
    private func bindAddBtn() {
        
    }
    
    private func bindSearchField() {
        
    }
    
    private func bindFilterBtn() {
        
    }
    
    private func bindMachineTblView() {
        
    }
    
    private func bindQRBtn() {
        
    }
    
    private func isMachineDataEmpty() {
        root.emptyLbl.isHidden = machineData.value.count != 0
        root.searchField.allowsEditingTextAttributes = machineData.value.count != 0
    }
    
}

extension MachineListController: MachineListViewControllerDelegate {
    
}
