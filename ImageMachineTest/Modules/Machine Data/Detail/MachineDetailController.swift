//
//  MachineDetailController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 30/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import RxDataSources
import BSImagePicker
import RxRelay
import Photos

class MachineDetailController: UIViewController {
    lazy var root = MachineDetailView()
    lazy var presenter: MachineDetailPresenterDelegate = MachineDetailPresenter(view: self)
    
    var disposable = DisposeBag()
    
    let imagePicker = ImagePickerController()
    var imgData = BehaviorRelay<[UIImage]>(value: [])
    var data: [UIImage] = []
    
    var machineDetailData: MachineRealmModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        presenter.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        binding()
        setImagePickerSetting()
    }
    
    private func binding() {
        bindMachineImgBtn()
        bindMachinImgCollection()
        bindMoreBtn()
    }
    
    private func bindMachineImgBtn() {
        func machineImgBtnPressed() {
            imagePicker.modalPresentationStyle = .popover
            self.presentImagePicker(imagePicker, select: { (assets) in
                debug("select")
            }, deselect: { (assets) in
                debug("deselect")
            }, cancel: { (assets) in
                debug("cancel")
            }, finish: { (assets) in
                self.imgData.accept(self.getAssetThumbnail(assets: assets)) 
            })
        }
        root.machineImgBtn.rx.tap.subscribe(onNext: machineImgBtnPressed).disposed(by: disposable)
    }
    
    private func setImagePickerSetting() {
        imagePicker.settings.selection.min = 1
        imagePicker.settings.selection.max = 10
        imagePicker.settings.preview.enabled = false
        imagePicker.settings.theme.selectionStyle = .numbered
    }
    
    private func getAssetThumbnail(assets: [PHAsset]) -> [UIImage] {
        var arrayOfImages = [UIImage]()
        for asset in assets {
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var image = UIImage()
            option.isSynchronous = true
            option.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
            manager.requestImage(for: asset, targetSize: CGSize(width: mainScreen.width, height: mainScreen.height), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                image = result!
                arrayOfImages.append(image)
            })
        }
        return arrayOfImages
    }
    
    private func bindMachinImgCollection() {
        imgData.asObservable().bind(to: root.imgCollectionView.rx.items(cellIdentifier: "cell", cellType: MachineDetailCell.self)) { (index, model, cell) in
            cell.machineImg.image = model
        }.disposed(by: disposable)
        
        root.imgCollectionView.rx.itemSelected.subscribe(onNext: { index in
            self.presenter.presentCarouselView(self.imgData.value, index.row)
        }).disposed(by: disposable)
    }
    
    private func bindMoreBtn() {
        func moreBtnPressed() {
            self.presentActionSheet(title: "What do you want?", message: "", alertAction: [
                UIAlertAction(title: "Edit", style: .default, handler: { _ in
                    self.pushToEditMachine()
                }),
                UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    self.deleteMachineData()
                }),
                UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ])
        }
        root.moreBtn.rx.tap.subscribe(onNext: moreBtnPressed).disposed(by: disposable)
    }
    
    private func pushToEditMachine() {
        guard let model = self.machineDetailData else { return }
        self.presenter.pushToMachineEdit(model)
    }
    
    private func deleteMachineData() {
        guard let deleteMachine = MachineRealmTable.getMachineBy(id: self.machineDetailData?.id ?? "") else { return }
        MachineRealmTable.deleteMachine(deleteMachine)
        self.navigationController?.popViewController(animated: true)
    }
}

extension MachineDetailController: MachineDetailViewControllerDelegate {
    
    func setMachineDetailData(_ model: MachineRealmModel) {
        machineDetailData = model
        root.idLbl.value = ": \(model.id)"
        root.nameLbl.value = ": \(model.name)"
        root.typeLbl.value = ": \(model.type)"
        root.qrLbl.value = ": \(model.qrNumber)"
        root.dateLbl.value = ": \(model.date)"
    }
}
