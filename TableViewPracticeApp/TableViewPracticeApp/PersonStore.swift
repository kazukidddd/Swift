//
//  PersonStore.swift
//  TableViewPracticeApp
//
//  Created by 木村和貴 on 2020/03/01.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import Foundation

final class PersonStore {

    static let shared = PersonStore()
    private var personList: PersonList!

    let dataUrl: URL = {
        let url = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask).first!
        let dataUrl = url.appendingPathComponent("data.json")
        return dataUrl
    }()

    private init(){
        load()
    }

    func count() -> Int {
        return personList.list.count
    }

    func add(_ p:Person) {
        personList.list.append(p)
    }

    func remove(_ index:Int) {
        personList.list.remove(at: index)
    }

    func get(index i: Int)->Person {
        return personList.list[i]
    }

    func move(from i: Int, to j: Int) {
        let p = get(index: i)
        personList.list.remove(at: i)
        personList.list.insert(p, at: j)
    }

    func load(){
        if
            let data = try? Data(contentsOf: dataUrl),
            let list = try? JSONDecoder().decode(PersonList.self, from: data) {
            self.personList = list
        } else {
            self.personList = PersonList()
        }
    }

    func save() throws {
        let data = try JSONEncoder().encode(personList)
        try data.write(to: dataUrl)
    }
}
