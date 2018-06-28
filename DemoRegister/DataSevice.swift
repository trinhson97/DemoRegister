//
//  DataSevice.swift
//  DemoRegister
//
//  Created by Son on 2018/06/26.
//  Copyright © 2018 son. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable,Any>

class DataSevice {
    static var shared: DataSevice = DataSevice()
    private var _city: [City]?
    var city : [City]{
        get {
            if _city == nil {
                getDataCity()
                
            }
            return _city ?? []
        }
        set {
            _city = newValue
        }
    }
    func getDataCity()  {
        _city = []
        var results : DICT?
        let filePath = Bundle.main.path(forResource: "Cities", ofType: "plist")
        FileManager.default.fileExists(atPath: filePath!)
        let dict = FileManager.default.contents(atPath: filePath!)
//get data
        do {
            let cities = try PropertyListSerialization.propertyList(from: dict!, options: .mutableContainersAndLeaves, format: nil) as? DICT
            results = cities
        }
        catch {
            print("error")
        }
// append getDataCity
        guard let dictionary = results else {return}
        guard let dictionaryData = dictionary["Cities"] as? [DICT] else {return}
        for dataCity in dictionaryData {
            if let city = City(dictionary: dataCity) {
                _city?.append(city)
            }
        }
        
        
    }
}
