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
        
    }
}

extension MachineAddController: MachineAddViewControllerDelegate {
    
}

