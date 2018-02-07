// Classes

class Person {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

var nicole = Singer(name: "Nicole", age: 27)
nicole.name
nicole.age
nicole.sing()

// class inheritance
class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrrrrrr")
    }
}

var matt = HeavyMetalSinger(name: "Matt", age: 30, noiseLevel: 10)
matt.sing()
