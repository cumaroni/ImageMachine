//
//  UIViewController+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import UIKit

extension UIViewController {
    
    public var hasTopNotch: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    func setAsPopupViewController() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .custom
    }
    
    func dismissKeyboardOnTap(_ sender: UIView? = nil) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        (sender ?? view).addGestureRecognizer(tapGesture)
    }
    
    @objc public func hideKeyboard(_ sender: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }
    
    func presentAlert(title: String, message: String, alertAction items: [UIAlertAction] = [], _ completion: (()->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for item in items {
            alert.addAction(item)
        }
        if items.count == 0 {
            alert.addAction(
                UIAlertAction(title: "Close", style: .cancel, handler: nil)
            )
        }
        present(alert, animated: true, completion: completion)
    }
    
    func setAlertAction(title: [String], handler: @escaping (UIAlertAction) -> Void) -> [UIAlertAction] {
        var arr: [UIAlertAction] = []
        for i in 0...title.count - 1 {
            arr.append(
                UIAlertAction(title: title[i], style: .default, handler: handler)
            )
        }
        arr.append(UIAlertAction(title: "Batal", style: .cancel, handler: nil))
        return arr
    }
    
    func presentActionSheet(title: String? = nil, message: String? = nil, alertAction items: [UIAlertAction] = [], _ completion: (()->Void)? = nil) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            presentAlert(title: title!, message: message!, alertAction: items, completion)
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for item in items {
            alert.addAction(item)
        }
        if items.count == 0 {
            alert.addAction(
                UIAlertAction(title: "Close", style: .cancel, handler: nil)
            )
        }
        present(alert, animated: true, completion: completion)
    } 

}
