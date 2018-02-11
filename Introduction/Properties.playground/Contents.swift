
struct Person {
    // static properties
    static let numberOfLegs = 2
    
    var clothes: String {
        //property observers
        willSet {
            updateUI("I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI("I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    var age: Int
    
    // computed properties
    var ageInDogYears: Int {
        return age * 7
    }
    
    func updateUI(_ msg: String) {
        print(msg)
    }
}

var me = Person(clothes: "T-shirt", age: 28)
me.clothes = "shirt"

print(me.ageInDogYears)
print(Person.numberOfLegs)
