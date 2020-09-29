//
//  BaseDebug.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import UIKit
import SwiftDate

public class BaseDebug {
    
    public class func get(key: TimeInterval) -> String? {
        return UserDefaults.standard.string(forKey: "\(BaseModel.applicationName)-BaseDebug-\(key)-value")
    }
    
    class func save(_ value: String, forKey: TimeInterval) {
        let key = Date.currentTimeInterval()
        save(key: key)
        UserDefaults.standard.set(value, forKey: "\(BaseModel.applicationName)-DebugData-\(key)-value")
    }
    
    public class var keys: [TimeInterval] {
        return (UserDefaults.standard.string(forKey: "\(BaseModel.applicationName)-BaseDebug-keys")?.components(separatedBy: ";") ?? []).map({ (time) in
            return TimeInterval(time) ?? 0
        })
    }
    
    private class func save(key: TimeInterval) {
        var keys = UserDefaults.standard.string(forKey: "\(BaseModel.applicationName)-BaseDebug-keys") ?? ""
        keys += ";\(key)"
        UserDefaults.standard.set(keys, forKey: "\(BaseModel.applicationName)-BaseDebug-keys")
    }
    
    public class func remove(key: TimeInterval) {
        UserDefaults.standard.set(nil, forKey: "\(BaseModel.applicationName)-BaseDebug-keys")
    }
    
    public class func removeAll() {
        for key in BaseDebug.keys {
            BaseDebug.remove(key: key)
        }
        UserDefaults.standard.set(nil, forKey: "\(BaseModel.applicationName)-BaseDebug-keys")
    }
    
}
