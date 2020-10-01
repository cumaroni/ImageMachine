//
//  CodeReaderController.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 01/10/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RxSwift
import AVFoundation

class CodeReaderController: UIViewController {
    lazy var root = CodeReaderView()
    lazy var presenter: CodeReaderPresenterDelegate = CodeReaderPresenter(view: self)
    
    var disposable = DisposeBag()
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        presenter.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScannerFrame()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    private func setupViewController() {
        captureSession = AVCaptureSession()
        setupScanner()
    }
    
    private func setupScannerFrame() {
        previewLayer.frame = root.scannerView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        root.scannerView.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }
    
    private func setupScanner() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        let videoInput: AVCaptureDeviceInput
        do { videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice) } catch { return }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            presentScanFailed("Your device does not support scanning a code from an item. Please use a device with a camera.")
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            presentScanFailed("Your device does not support scanning a code from an item. Please use a device with a camera.")
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    }
    
    private func presentScanFailed(_ message: String) {
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
        
        self.presentAlert(title: "Scan Gagal", message: message, alertAction: [UIAlertAction(title: "Tutup", style: .default, handler: { _ in
            self.captureSession.startRunning()
        })])
    }
}

extension CodeReaderController: CodeReaderViewControllerDelegate {
    
}

extension CodeReaderController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            let convertedValue = Int(stringValue) ?? 0
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            if metadataObject.type == AVMetadataObject.ObjectType.qr && !String.empty(stringValue) {
                debug(stringValue)
                do {
                    guard let realmData = MachineRealmTable.getMachineBy(qrCodeNmbr: convertedValue) else { return }
                    presenter.pushToMachineDetail(realmData)
                    captureSession.stopRunning()
                } catch {
                    debug(error)
                }
            } else {
                presentScanFailed("Kode QR yang anda scan bukan digenerate oleh Dosen STMIK TIME")
            }
        } else {
            presentScanFailed("Kode QR yang anda scan bukan digenerate oleh Dosen STMIK TIME")
        }
    }
    
}
