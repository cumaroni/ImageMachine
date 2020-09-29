//
//  MachineRealmTable.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//
 
import RealmSwift

class MachineRealmTable: BaseTable<MachineRealmModel> {
    
    private var Machine: Results<MachineRealmModel>? = nil
    
    override init() {
        
    }
    
    class func getAllMachine() -> [MachineRealmModel]? {
        let data = MachineRealmTable.data.toArray(ofType: MachineRealmModel.self) as [MachineRealmModel]
        return data.count > 0 ? data : nil
    }
    
    class func getMachineBy(id: String) -> MachineRealmModel? {
        return MachineRealmTable.data.filter("id = %@", id).first
    }
       
    class func insertMachine(_ data: MachineRealmModel) {
        guard MachineRealmTable.getMachineBy(id: data.id) == nil else { return }
        MachineRealmTable.add(data)
    }
    
    class func updateMachine(_ data: MachineRealmModel) {
        guard let note = MachineRealmTable.getMachineBy(id: data.id) else { return }
        do {
            let realm = try! Realm()
            realm.beginWrite()
            note.name = data.name
            note.type = data.type
            note.qrNumber = data.qrNumber
            note.date = data.date
            try realm.commitWrite()
        } catch {
            debug("Error \(error)")
        }
    }
    
    class func deleteMachine(_ data: MachineRealmModel) {
        guard let note = MachineRealmTable.getMachineBy(id: data.id) else { return }
        let realm = try! Realm()
        do {
            realm.beginWrite()
            realm.delete(note)
            try realm.commitWrite()
        } catch {
            debug("Error \(error)")
        }
        
    }
    
}
