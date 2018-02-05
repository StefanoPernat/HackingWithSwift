var paul_action: String
var person = "player"

if person == "hater" {
    paul_action = "hate"
} else if person == "player" {
    paul_action = "play"
} else {
    paul_action = "cruise"
}

var action: String
var stayOutTooLate = true
var nothingInBrain = true

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}

// Loops
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

// for loop closed range operator
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

// for loop looping over arrays
var songs = ["Wet", "Mz Hyde", "Make me wanna die", "Echame la culpa"]

for song in songs {
    print("My favorite song is \(song)")
}

// alternative way to loop over an array
for i in 0..<songs.count {
    print("I love listening to \(songs[i])")
}

// while loops
var counter = 0

while true {
    print("Counter is now: \(counter)")
    counter += 1
    if counter == 556 {
        break
    }
}

for song in songs {
    if song == "Wet" {
        continue
    }
    print("My new favorite song is \(song)")
}

var liveAlbums = 2

switch liveAlbums {
case 0:
    print("You are just starting out")
case 1:
    print("mah")
case 2:
    print("nice number")
default:
    print("Have you released something new")
}

switch liveAlbums {
case 0...1:
    print("You are just starting out")
case 2...3:
    print("You're a rising star")
case 4...5:
    print("You're world famous")
default:
    print("Have you released something new")
}
