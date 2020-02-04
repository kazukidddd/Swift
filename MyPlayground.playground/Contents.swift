import UIKit

var temporaryData: String?

class SomeClass {
    init() {
        print("casredafsga")
        temporaryData = "afdsfasff"
    }
    
    deinit {
        print("clean up")
        temporaryData = nil
    }
}

var someClass: SomeClass? = SomeClass()
temporaryData

someClass = nil
temporaryData

protocol Ownable {
    var owner: String { get set }
}

protocol Animal {
    func sleep()
    func move()
}

extension Animal {
    func sleep() { print("sleeping") }
}

struct Dog: Animal,Ownable {
    var owner: String
    func move() {
        print("Running")
    }
}

struct Cat: Animal,Ownable {
    var owner: String
    func move() {
        print("Prancing")
    }
}

struct WildEagle: Animal {
    func move() {
        print("Flying")
    }
}

var dog = Dog.init(owner: "aaaa")
dog.owner
dog.move()

struct User {
    let id: Int
    let name: String
    let mailAdress: String?
    
    init?(json: [String : Any]) {
        guard let id = json["id"] as? Int,
            let name = json["name"] as? String else {
                return nil
        }
        self.id = id
        self.name = name
        self.mailAdress = json["email"] as? String
    }
}

let json: [String : Any] = [
    "id": 123,
    "name": "kimura"
]

if let user = User(json: json) {
    print("id:\(user.id),name:\(user.name)")
}else{
    print("invalid JSON")
}
