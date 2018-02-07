// Enumeration

// with additional values
enum WeatherType {
    case sun, cloud, rain, snow
    case wind(speed: Int)
}

func getHaterStatus(when weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    default:
        return "hate"
    }
}

getHaterStatus(when: .wind(speed: 5))
