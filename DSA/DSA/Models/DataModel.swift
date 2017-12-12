//
//  DataModel.swift
//  DSA
//
//  Created by Caroline Cruz on 12/12/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import Foundation

class DataModel {
    static let kPathNAme = "DSAListKeyedArchiver.plist"
    private init() {}
    static let shared  = DataModel()
    
    private var lists = [DSA]() {
        didSet {
            //            ToDo: implement save
            saveDSAList()
        }
    }
    // returns documents directory path for the app
    public func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // returns supplied path name in documents directory
   private func dataFilePath(pathName: String) -> URL {
        return DataModel.shared.documentsDirectory().appendingPathComponent(pathName)
    }
    
//    save
    func saveDSAList() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathNAme).path
        NSKeyedArchiver.archiveRootObject(lists, toFile: path)
//        for testing purposes
        print(documentsDirectory())
    }
    
//    load
    func load() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathNAme).path
        if let results = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [DSA] {
            lists = results
        }
    }
//    create
    func addDSAItemToList(dsaItem item: DSA) {
        lists.append(item)
    }
    
//    read
    func getLists() -> [DSA] {
        return lists
    }
    
//
}
