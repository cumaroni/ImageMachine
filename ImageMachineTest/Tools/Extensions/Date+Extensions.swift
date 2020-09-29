//
//  Date+Extensions.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import SwiftDate

extension Date {
    
    public static func now() -> DateInRegion {
        return Date().dateByAdding(7, Calendar.Component.hour)
    }
    
    public func now() -> DateInRegion {
        return self.dateByAdding(7, Calendar.Component.hour)
    }
    
    public static func currentTimeInterval() -> TimeInterval {
        return Date.timeIntervalBetween1970AndReferenceDate
    }
    
    public var minGMT7: DateInRegion {
        return self.dateByAdding(7, Calendar.Component.hour)
    }
    
    var differenceDate: TimeInterval {
        let currentTime = Date().timeIntervalSince1970
        let time = currentTime - self.timeIntervalSince1970
        return time
    }
    
}
