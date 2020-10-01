//
//  MachineAddController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift 

class MachineAddController: UIViewController {
    lazy var root = MachineAddView()
    lazy var presenter: MachineAddPresenterDelegate = MachineAddPresenter(view: self)
     
    var disposable = DisposeBag()
    
    private var isUpdate: Bool = false
    
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
        machineModel.name = root.nameField.value ?? ""
        machineModel.type = root.typeField.value ?? ""
        machineModel.qrNumber = Int(root.qrCodeField.value ?? "") ?? 0
        machineModel.date = getCurrentDate()
        if isUpdate == true {
            MachineRealmTable.updateMachine(machineModel)
            presenter.presentSuccessAlert("Update")
        } else {
            machineModel.id = uuid
            MachineRealmTable.insertMachine(machineModel)
            presenter.presentSuccessAlert("Add")
        }
        
    }
    
}

extension MachineAddController: MachineAddViewControllerDelegate {
    
    func updateData(_ data: MachineRealmModel) {
        self.isUpdate = true
        root.nameField.value = data.name
        root.typeField.value = data.type
        root.qrCodeField.value = "\(data.qrNumber)"
        root.addBtn.setTitle("UPDATE", for: .normal)
    }
}

