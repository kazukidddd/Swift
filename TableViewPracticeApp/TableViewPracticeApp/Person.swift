//
//  Person.swift
//  TableViewPracticeApp
//
//  Created by 木村和貴 on 2020/03/01.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import Foundation

class Person : Codable {
    var name : String
    init(_ name:String) {
        self.name = name
    }
}
