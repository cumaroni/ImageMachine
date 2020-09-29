//
//  MachineRealmModel.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RealmSwift

class MachineRealmModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var qrNumber: Int = 0
    @objc dynamic var date: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
