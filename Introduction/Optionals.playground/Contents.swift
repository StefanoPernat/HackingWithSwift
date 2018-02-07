// Optionals

func getHaterStatus(when wheather: String) -> String? {
    if wheather.uppercased() == "SUNNY" {
        return nil
    } else {
        return "Hate"
    }
}

func takeHaterAction(status: String) {
    if status.lowercased() == "hate" {
        print("Hating")
    }
}

var status = getHaterStatus(when: "rainy")

// unwrapping optionals
if let haterStatus = getHaterStatus(when: "rainy") {
    takeHaterAction(status: haterStatus)
}

// force unwrapping optionals
let newStatus = getHaterStatus(when: "rainy")

print("The hater is now \(newStatus!)")

// Optional chaining
let uppercasedStatus = (getHaterStatus(when: "rainy")?.uppercased())!

print(uppercasedStatus)

// nil coalescing operator
let morningStatus = getHaterStatus(when: "sunny") ?? "unknown"
print(morningStatus)
