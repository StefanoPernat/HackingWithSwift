var evenNumbers = [2, 4, 6, 8]
var songs = ["Wet", "Whore", "Echame La Culpa", "Hero"]

songs[0]
songs[1]
songs[2]
songs[3]
//songs[4]  // fatal error index out of range

type(of: songs) // knowing the type of a variable

// Creating arrays
var other_songs: [String] = []

// or

other_songs = [String]()

other_songs = ["I miss the misery", "Mz. Hyde", "Bad Romance", "Make me wanna die"]


// Array operators
var both = songs + other_songs

both += ["Just Tonight"]
