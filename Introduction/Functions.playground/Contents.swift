// Functions

func favoriteAlbum() {
    print("My favorite album is Fallen")
}

favoriteAlbum()


func anotherFavoriteAlbum(name: String) {
    print("My favorite album is \(name)")
}

anotherFavoriteAlbum(name: "Nobody's Daughter")


func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Nobody's Daughter", year: 2010)

func countLettersInString(string: String) {
    print("The string has \(string.count) letters")
}

countLettersInString(string: "Stefano")

// external and internal parameter
func countLetters(in string: String){
    print("The string has \(string.count) letters")
}


countLetters(in: "Trentino Sviluppo")

// function without external parameter
func reverse(_ string: String) -> String {
    var newString = ""
    
    for ch in string.reversed() {
        newString.append(ch)
    }
    
    return newString
}

print(reverse("Stefano"))
