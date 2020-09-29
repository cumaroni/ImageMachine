//
//  BaseTable.swift
//  ImageMachineTest
//
//  Created by Cumaroni on 29/09/20.
//  Copyright © 2020 Roniaja. All rights reserved.
//

import RealmSwift

var realm: Realm!

class BaseTable<T: Object>  {
    
    class var data: Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self)
    }
    
    class var emptyData: Results<T> {
        return BaseTable<T>.data.filter("EMPTYDATA")
    }
    
    class func add(_ data: T) {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.add(data, update: .modified)
            }
        } catch {
            debug("Add Realm Error \(error)")
        }
    }
    
    class func delete(predicate: NSPredicate) {
        do {
            let realm = try! Realm()
            let deletedData = BaseTable<T>.data.filter(predicate)
            
            try realm.write {
                realm.delete(deletedData)
            }
            
        } catch {
            debug("Delete Realm Error \(error)")
        }
    }
    
    class func delete(key: String, where value: String) {
        do {
            let realm = try! Realm()
            let deletedData = BaseTable<T>.data.filter("\(key) = %@", value)
            
            try realm.write {
                realm.delete(deletedData)
            }
            
        } catch {
            debug("Delete Realm Error \(error)")
        }
    }
    
    class func deleteAll() {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            debug("Delete All Realm Error \(error)")
        }
    }
    
    class func deleteArray(key: String, where value: [String]) {
        do {
            let realm = try! Realm()
            for id in value {
                let data = BaseTable<T>.data.filter("\(key) = %@", id)
                try realm.write {
                    realm.delete(data)
                }
            }
        } catch {
            debug("Delete Realm Error \(error)")
        }
    }
    
    func get() -> Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self)
    }
    
}
