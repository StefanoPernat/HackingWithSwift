// structs

struct Person {
    var clothes:    String
    var shoes:      String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let me = Person(clothes: "T-shirt", shoes: "sneakers")

print(me.clothes)
print(me.shoes)

var mum = me
mum.shoes = "flip flops"

print(me)
print(mum)

me.describe()
mum.describe()

struct Rectangle {
    var width: Int
    var height: Int
    
    // mutating func
    mutating func scale(by value: Int) {
        self.width *= value
        self.height *= value
    }
}


let r = Rectangle(width: 1, height: 1)
print(r)

var rec = Rectangle(width: 3, height: 3)
rec.scale(by: 5)

print(rec)
