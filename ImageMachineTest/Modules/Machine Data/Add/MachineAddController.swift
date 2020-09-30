//
//  MachineAddController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import RxRelay

class MachineAddController: UIViewController {
    lazy var root = MachineAddView()
    lazy var presenter: MachineAddPresenterDelegate = MachineAddPresenter(view: self)
     
    var disposable = DisposeBag()
    
    
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
    }
    
    private func bindAddBtn() {
        func addBtnPressed() {
            if isMachineNameValid() && isMachineTypeValid() && isQrCodeValid() == true {
                 saveMachineDataToTable()
            }
        }
        root.addBtn.rx.tap.subscribe(onNext: addBtnPressed).disposed(by: disposable)
    }
    
    private func isMachineNameValid() -> Bool {
        if String.empty(root.nameField.value) {
            presenter.presentErrorAlert("Machine Name can't be empty")
            return false
        }
        return true
    }
    
    private func isMachineTypeValid() -> Bool {
        if String.empty(root.typeField.value) {
            presenter.presentErrorAlert("Machine Type can't be empty")
            return false
        }
        return true
    }
    
    private func isQrCodeValid() -> Bool {
        if (root.qrCodeField.value?.count ?? 0) <= 6 {
            presenter.presentErrorAlert("QR Code must have more than 6 number")
            return false
        } else if String.empty(root.qrCodeField.value ?? "") {
            presenter.presentErrorAlert("QR Code can't be empty")
            return false
        }
        return true
    }
    
    private func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "ID")
        let result = formatter.string(from: date)
        return result
    }
    
    private func saveMachineDataToTable() {
        let machineModel = MachineRealmModel()
        let uuid = UUID().uuidString
        machineModel.id = uuid
        machineModel.name = root.nameField.value ?? ""
        machineModel.type = root.typeField.value ?? ""
        machineModel.qrNumber = Int(root.qrCodeField.value ?? "") ?? 0
        machineModel.date = getCurrentDate()
        MachineRealmTable.insertMachine(machineModel)
        presenter.presentSuccessAlert()
    }
    
}

extension MachineAddController: MachineAddViewControllerDelegate {
    
}

