//
//  City.swift
//  DemoRegister
//
//  Created by Son on 2018/06/26.
//  Copyright © 2018 son. All rights reserved.
//

import Foundation

class City {
    var cityCode: Int
    var name: String
    init?(dictionary: DICT) {
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        guard let name = dictionary["Name"] as? String else {return nil}
        self.cityCode = cityCode
        self.name = name
    }
}
