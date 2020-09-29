//
//  BaseModel.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit

public enum BaseLang: Int {
    case id = -1
    case en = 0
    case ch = 1
}

public class BaseModel {
    
    public static var SDLang: [String : [String]] = [:]
    
    public static func concat<Key, Value>(_ source: inout [Key: Value], withNewData right: [Key: Value]?) {
        for (key, value) in right ?? [:] {
            source.updateValue(value, forKey: key)
        }
    }
    
    public static var appName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    public static var applicationName: String = ""
    
    public static func key(_ value: String) -> String {
        return BaseModel.appName + value
    }
    
    public class func getClipboard() -> String {
        guard UIPasteboard.general.types.count > 0 else {
            return ""
        }
        return UIPasteboard.general.value(forPasteboardType: UIPasteboard.general.types[0]) as? String ?? ""
    }
    
    public class func setClipboard(_ value: String) {
        guard UIPasteboard.general.types.count > 0 else {
            return
        }
        UIPasteboard.general.setValue(value, forPasteboardType: UIPasteboard.general.types[0])
    }
    
}
