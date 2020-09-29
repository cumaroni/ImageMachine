//
//  BaseSource.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

// screen for root view
public private(set) var mainScreen = UIScreen.main.fixedCoordinateSpace.bounds
public func safeInset() -> UIEdgeInsets {
    guard let tmp: UIEdgeInsets = UIApplication.shared.keyWindow?.safeAreaInsets else { return .zero }
    return tmp
}
// mainScreen for UIElement (subviews of rootView)
// the value still portrait event the view is landscape
var fontSize: CGSize = .zero

fileprivate var _apiLog = true
fileprivate var _paramLog = false
fileprivate var _savingLog = false

public func debug(key: String? = nil, _ variable: Any?, _ isNil: String = "nil") {
    #if DEBUG
    let txt = (key ?? "print") + " :\n \(variable ?? isNil)\n"
    print(txt)
    var log = BaseDebug.get(key: BaseSource.debugKey) ?? ""
    log += txt + "\n"
    BaseDebug.save(log, forKey: BaseSource.debugKey)
    #endif
}

public func apiLog(key: String? = nil, _ variable: Any?, isNil: String = "nil", param: Any? = nil) {
    guard let param = param else {
        guard _apiLog else { return }
        debug(key: key, variable, isNil)
        return
    }
    debug(key: key, "\(variable ?? "")\(param)", isNil)
}

public class BaseSource {
    
    private static var workItem: [String : DispatchWorkItem] = [:]
    private static var action: [String : DispatchWorkItem] = [:]
    
    fileprivate static var debugKey: TimeInterval! = Date.currentTimeInterval()
    
    public static var window: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    public static var navbar: UINavigationController? {
        return BaseSource.window?.rootViewController as? UINavigationController
    }
    
    public class func cancelPreviousAction(with id: String) {
        BaseSource.action[id]?.cancel()
        BaseSource.action[id] = nil
    }
    
    class public func enableConstraintLogging(_ bool: Bool) {
        UserDefaults.standard.set(bool, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        #if RELEASE
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        #endif
    }
    
    public class func enableParametersLogging(_ bool: Bool) {
        _paramLog = bool
    }
    
    public class func enableRestApiLogging(_ bool: Bool) {
        _apiLog = bool
    }
    
    public class func enableDebugLogging(_ bool: Bool) {
        if !bool {
            BaseSource.debugKey = nil
        }
        _savingLog = bool
    }
    
    @objc public class func orientationChanged() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        if UIDevice.current.orientation.isLandscape {
            mainScreen.size.width = height
            mainScreen.size.height = width
        } else {
            mainScreen.size.width = width
            mainScreen.size.height = height
        }
    }
    
    public class func setupFontSize() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        fontSize = UIScreen.main.bounds.size
        if width > height {
            fontSize = CGSize(width: height, height: width)
        }
        mainScreen.origin = .zero
        BaseSource.orientationChanged()
        
        NotificationCenter.default.addObserver(
            BaseSource.self,
            selector: #selector(orientationChanged),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
}
