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
    private var selectedNoteIndex: IndexPath = IndexPath()
    
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

extension MachineListController: MachineListViewControllerDelegate {
    
}
