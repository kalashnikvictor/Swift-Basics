import UIKit

enum engineStatus {
    case on, off
}

enum windowsStatus {
    case up, down
}

enum rearStatus {
    case full, empty
}

struct sportCar {
    let brand: String
    let yearOfManufacture: Int
    var color: String
    var rearVolume: Double
    var km: Double {
        didSet {
            let newDistance = km - oldValue
            print("Пройдено новое расстояние в \(newDistance) км ")
        }
    }
    var engineStatus: engineStatus {
        willSet {
            if newValue == .on  {
                print("Двигатель включен")
            } else {
                print("Двигатель выключен")
            }
        }
    }
    var windowsStatus: windowsStatus {
        willSet {
            if newValue == .down  {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
    var rearStatus: rearStatus {
        willSet {
            if newValue == .full  {
                print("Багажник заполнен")
            } else {
                print("Багажник свободен")
            }
        }
    }
    
    mutating func engineStart() {
        self.engineStatus = .on
    }
        mutating func windowsOpen() {
            self.windowsStatus = .down
    }
    
    mutating func rearUnload() {
        self.rearStatus = .empty
    }
    
    mutating func colorChange(a: String) {
        switch a {
        case "white":
            self.color = "white"
        case "red":
            self.color = "red"
        case "dark_blue":
            self.color = "dark_blue"
        case "yellow":
            self.color = "yellow"
        default:
            print("Input error")
        }
    }
}

struct truckCar {
    let brand: String
    let yearOfManufacture: Int
    var color: String
    var rearVolume: Double
    var km: Double {
        didSet {
            let newDistance = km - oldValue
            print("Пройдено новое расстояние в \(newDistance) км ")
        }
    }
    var engineStatus: engineStatus {
        willSet {
            if newValue == .on  {
                print("Двигатель включен")
            } else {
                print("Двигатель выключен")
            }
        }
    }
    var windowsStatus: windowsStatus {
        willSet {
            if newValue == .down  {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
    var rearStatus: rearStatus {
        willSet {
            if newValue == .full  {
                print("Грузовая платформа заполнена")
            } else {
                print("Грузовая платформа свободена")
            }
        }
    }
    
    mutating func engineStart() {
        self.engineStatus = .on
    }
    mutating func engineStop() {
        self.engineStatus = .off
    }
    
        mutating func windowsOpen() {
            self.windowsStatus = .down
    }
    mutating func windowsClose() {
        self.windowsStatus = .up
    }
    
    mutating func rearUnload() {
        self.rearStatus = .empty
    }
    mutating func rearLoad() {
        self.rearStatus = .full
    }
    
    mutating func colorChange(a: String) {
        switch a {
        case "white":
            self.color = "white"
        case "red":
            self.color = "red"
        case "dark_blue":
            self.color = "dark_blue"
        case "yellow":
            self.color = "yellow"
        default:
            print("Input error")
        }
    }
}

var sportCar1 = sportCar(brand: "BMW", yearOfManufacture: 1995, color: "black", rearVolume: 200, km: 125000, engineStatus: .off, windowsStatus: .down, rearStatus: .empty)
var sportCar2 = sportCar(brand: "Audi", yearOfManufacture: 2000, color: "white", rearVolume: 250, km: 95000, engineStatus: .on, windowsStatus: .up, rearStatus: .full)

sportCar1.engineStart()
sportCar1.colorChange(a:"red")
sportCar1.km = 200_000

sportCar2.windowsOpen()
sportCar2.rearUnload()
sportCar2.colorChange(a: "dark_blue")
sportCar2.km = 100_000

var truckCar1 = truckCar(brand: "МАЗ", yearOfManufacture: 1998, color: "yellow", rearVolume: 1000, km: 350000, engineStatus: .off, windowsStatus: .down, rearStatus: .full)
var truckCar2 = truckCar(brand: "КаМАЗ", yearOfManufacture: 2009, color: "red", rearVolume: 1500, km: 200000, engineStatus: .on, windowsStatus: .up, rearStatus: .empty)

truckCar1.engineStart()
truckCar1.windowsOpen()
truckCar1.rearUnload()
truckCar1.colorChange(a: "white")
truckCar1.km = 360_000

truckCar2.engineStop()
truckCar2.windowsClose()
truckCar2.rearLoad()
truckCar2.colorChange(a: "yellow")
truckCar2.km = 250_000

print(sportCar1)
print(sportCar2)

print(truckCar1)
print(truckCar2)

