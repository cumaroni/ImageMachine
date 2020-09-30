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
        getAllMachineData()
    }
    
    private func setupViewController() {
        binding()
    }
    
    private func binding() {
        bindAddBtn()
        bindSearchField()
        bindSortBtn()
        bindMachineTblView()
        bindQRBtn()
    }
    
    private func getAllMachineData() {
        guard let allData = MachineRealmTable.getAllMachine() else { return }
        machineData.accept(allData)
        data = allData
        isMachineDataEmpty()
    }
    
    private func bindAddBtn() {
        func addBtnPPressed() {
            presenter.pushToMachineAdd()
        }
        root.addBtn.rx.tap.subscribe(onNext: addBtnPPressed).disposed(by: disposable)
    }
    
    private func bindSearchField() {
        func searchEditingChanged() {
            if String.empty(root.searchField.text) {
                machineData.accept(data)
            } else {
                machineData.accept(data.filter({
                    $0.name.localizedCaseInsensitiveContains(root.searchField.text ?? "")
                }))
            }
            root.machineTblView.reloadData()
        }
        root.searchField.rx.controlEvent(.editingChanged).subscribe(onNext: searchEditingChanged).disposed(by: disposable)
    }
    
    private func bindSortBtn() {
        func sortBtnPressed() {
            presenter.presentSortAlert()
        }
        root.sortBtn.rx.tap.subscribe(onNext: sortBtnPressed).disposed(by: disposable)
    }
    
    private func bindMachineTblView() {
        machineData.asObservable().bind(to: root.machineTblView.rx.items(cellIdentifier: "cell", cellType: MachineListCell.self)) { (index, model, cell) in
            cell.nameLbl.text = model.name
            cell.typeLbl.text = model.type
        }.disposed(by: disposable)
        
        root.machineTblView.rx.modelSelected(MachineRealmModel.self).subscribe(onNext: { model in
            self.presenter.pushToMachineDetail(model)
        }).disposed(by: disposable)
    }
    
    private func bindQRBtn() {
        
    }
    
    private func isMachineDataEmpty() {
        root.emptyLbl.isHidden = machineData.value.count != 0
        root.searchField.isUserInteractionEnabled = machineData.value.count != 0
    }
    
}

extension MachineListController: MachineListViewControllerDelegate {
    
    func sortMachineData(_ isByName: Bool) {
        let sorted = isByName == true ? data.sorted(by: {$0.name < $1.name}) : data.sorted(by: {$0.type < $1.type})
        machineData.accept(sorted)
    }
    
}
