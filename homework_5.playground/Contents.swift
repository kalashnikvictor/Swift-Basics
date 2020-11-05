import UIKit

enum WindowStatus {
    case up, down
}

protocol Car {
    var length: Double { get set }
    var width: Double { get set }
    var weight: Double { get set }
    var engine: Bool { get set }
    var windows: WindowStatus { get set }
    func makeSound() -> String
}

extension Car {
    func openWindow(_ windowStatus: String){
        switch windowStatus {
        case "open":
            WindowStatus.down
            print("Окно открыто")
        case "close":
            WindowStatus.up
            print("Окно закрыто")
        default:
            WindowStatus.up
            print("Окно закрыто")
        }
    }
    
    mutating func engineStatus(_ engineStatus: String){
        switch engineStatus {
        case "on":
            engine = true
            print("Двигатель включен")
        case "off":
            engine = false
            print("Двигатель выключен")
        default:
            engine = false
        }
    }
}

class SportCar: Car {
    var windows: WindowStatus
    var length: Double
    var width: Double
    var weight: Double
    var engine: Bool
    func makeSound() -> String {
      return "уиииииииии"
    }
    let maxSpeed: Double
    var km: Double
    let acceleration: Double
    init(length: Double, width: Double, weight: Double, engine: Bool, maxSpeed: Double, km: Double, acceleration: Double, windowStatus: WindowStatus) {
        self.length = length
        self.width = width
        self.weight = weight
        self.engine = engine
        self.maxSpeed = maxSpeed
        self.km = km
        self.acceleration = acceleration
        self.windows = windowStatus
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "length:\(length), width:\(width), weight:\(weight), engineStatus:\(engine), maxSpeed:\(maxSpeed), km:\(km), acceleration:\(acceleration), windows:\(windows) "
    }
}

class TruckCar: Car {
    var windows: WindowStatus
    var length: Double
    var width: Double
    var weight: Double
    var engine: Bool
    func makeSound() -> String {
      return "бррррррррр"
    }
    let maxCargo: Double
    init(length: Double, width: Double, weight: Double, engine: Bool, windows: WindowStatus, maxCargo: Double){
        self.length = length
        self.width = width
        self.weight = weight
        self.engine = engine
        self.windows = windows
        self.maxCargo = maxCargo
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "length:\(length), width:\(width), weight:\(weight), engineStatus:\(engine), windows:\(windows), maxCargo:\(maxCargo) "
    }
}

var bmw = SportCar(length: 4, width: 1.5, weight: 300, engine: false, maxSpeed: 330, km: 0, acceleration: 5, windowStatus: .down)
var audi = SportCar(length: 3.9, width: 1.6 , weight: 299, engine: true, maxSpeed: 329, km: 1, acceleration: 4.9, windowStatus: .up)

var volvoTruck = TruckCar(length: 10, width: 3, weight: 2900, engine: false, windows: .down, maxCargo: 10000)
var mercedesTruck = TruckCar(length: 11, width: 3, weight: 3900, engine: true, windows: .up, maxCargo: 10250)

bmw.makeSound()
bmw.engineStatus("on")
bmw.openWindow("open")
audi.makeSound()
audi.engineStatus("off")
audi.openWindow("close")
print("\(bmw.description)")
print("\(audi.description)")

volvoTruck.makeSound()
volvoTruck.engineStatus("on")
volvoTruck.openWindow("close")
mercedesTruck.makeSound()
mercedesTruck.engineStatus("off")
mercedesTruck.openWindow("open")
print("\(volvoTruck.description)")
print("\(mercedesTruck.description)")
