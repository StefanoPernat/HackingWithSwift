class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album '\(name)' sold!"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album '\(name)' from the studio \(studio) sold!"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album '\(name)' sold!"
    }
}

var bigFatLie = StudioAlbum(name: "Big Fat Lie", studio: "My studio")
var camila = StudioAlbum(name: "Camila", studio: "Don't know")
var myLive = LiveAlbum(name: "A live", location: "London")

// polymorphism
var allAlbums: [Album] = [bigFatLie, camila, myLive]

for album in allAlbums {
    print(album.getPerformance())
    
    // typecasting
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}
