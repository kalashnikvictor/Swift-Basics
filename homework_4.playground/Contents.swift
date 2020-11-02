import UIKit

enum FuelChange {
    case diesel, petrol, electic
}

enum DoorsStatus {
    case open, closed
}

enum WindowsStatus {
    case up, down
}

enum Upholstery{
    case simpleBMW
    case vernascaLeather
    case merinoLeather
}

enum Trims{
    case simpleBMW
    case wood
    case aluminium
}

enum Windshield{
    case simpleBMW
    case scena_ramic
}

class Car {
    let brand: String
    let yearOfManufacture: Int
    var color: UIColor
    let enginePower: Int
    var fuelType: FuelChange
    let length: Double
    let height: Double
    let topSpeed: Int
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Пройден новый участок дороги \(distance) km")
        }
    }
    var electricEngine: Bool
    let luggageCapacity: Double
    let accelerationTo100: Double
    var doorsStatus: DoorsStatus
    var windowsStatus: WindowsStatus
    
    static var carCount = 0
    static var brokenCarCount = 0
    init(brand: String, yearOfManufacture: Int, color: UIColor, enginePower: Int, length: Double, height: Double, topSpeed: Int, km: Double, electricEngine: Bool,luggageCapacity: Double, accelerationTo100: Double, fuelType: FuelChange, doorsStatus: DoorsStatus, windowsStatus: WindowsStatus) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.color = color
        self.enginePower = enginePower
        self.length = length
        self.height = height
        self.topSpeed = topSpeed
        self.km = km
        self.electricEngine = electricEngine
        self.luggageCapacity = luggageCapacity
        self.accelerationTo100 = accelerationTo100
        self.fuelType = fuelType
        self.doorsStatus = doorsStatus
        self.windowsStatus = windowsStatus
        Car.carCount += 1
    }
    
    deinit {
        Car.brokenCarCount += 1
    }
    
    static func countInfo(){
        print("Всего выпущено \(self.carCount) автомобилей")
    }
    
    static func brokenCountInfo(){
        print("Cломалось \(self.brokenCarCount) автомобилей")
    }
    
    func fuelChange(_ newFuel: Int){
        switch newFuel {
        case 1:
            fuelType = .diesel
        case 2:
            electricEngine = true; fuelType = .electic
        default:
            fuelType = .petrol
        }
        if electricEngine == true {
            print("На автомобиль установлен электродвигатель")
        } else {
            print("Тип двигателя изменен на \(fuelType)\nТеперь автомобиль потребляет \(fuelType) топливо ")
        }
    }
    
    func doorStatusChange(_ doorState: String) {
        switch doorState {
        case "open":
            doorsStatus = .open
            print("Двери открыты")
        case "close":
            doorsStatus = .closed
            print("Двери закрыты")
        default:
            doorsStatus = .open
        }
    }
    
    func windowStatusChange(_ windowsState: String) {
        switch windowsState {
        case "open":
            windowsStatus = .down
            print("Окна открыты")
        case "close":
            windowsStatus = .up
            print("Окна закрыты")
        default:
            windowsStatus = .up
        }
    }
}

class BMW: Car{
    var mSpecification: Bool
    var upholsteryType: Upholstery
    var trimsType: Trims
    var windshieldType: Windshield
    static var count = 0
    init(brand: String, yearOfManufacture: Int, color: UIColor, enginePower: Int, length: Double, height: Double, topSpeed: Int, km: Double, electricEngine: Bool ,luggageCapacity: Double, accelerationTo100: Double, fuelType: FuelChange, doorsStatus: DoorsStatus, windowsStatus: WindowsStatus, mSpecification: Bool, upholsteryType: Upholstery, trimsType: Trims, windshieldType: Windshield  ) {
        self.mSpecification = mSpecification
        self.upholsteryType = upholsteryType
        self.trimsType = trimsType
        self.windshieldType = windshieldType
        super.init(brand: brand, yearOfManufacture: yearOfManufacture, color: color, enginePower: enginePower, length: length, height: height, topSpeed: topSpeed, km: km, electricEngine: electricEngine, luggageCapacity: luggageCapacity, accelerationTo100: accelerationTo100, fuelType: fuelType, doorsStatus: doorsStatus, windowsStatus: windowsStatus)
        BMW.count += 1
    }
    
    static func bmwCount(){
        print("Выпущено \(self.count) автомобилей BMW")
    }
    
    func upholsteryChange(_ leatherType: Int) {
        switch leatherType {
        case 1:
            upholsteryType = .merinoLeather
        case 2:
            upholsteryType = .vernascaLeather
        default:
            upholsteryType = .simpleBMW
        }
        if upholsteryType == .simpleBMW {
            print("Интерьер салона - базовый. Для замены кожи салона выберите новый вариант.")
        } else {
            print("Интерьер салона был изменен на \(upholsteryType)")
        }
    }
    
    func trimsChange(_ trimsNew: Int) {
        switch trimsNew {
        case 1:
            trimsType = .wood
        case 2:
            trimsType = .aluminium
        default:
            trimsType = .simpleBMW
        }
        if trimsType == .simpleBMW {
            print("Материал приборной панели - базовый. Для замены кожи салона выберите новый вариант.")
        } else {
            print("Материал приборной панели был изменен на \(trimsType)")
        }
        
    }
    
    func windshieldChange() {
        if windshieldType == .scena_ramic {
            print("У вас уже установлено панорамное стекло")
        } else {
        windshieldType = .scena_ramic
            print("Было установлено панорамное стелко")
            
        }
    }
    
    override func fuelChange(_ newFuel: Int) {
        super.fuelChange(newFuel)
        print("Поздравляем с заменой двигателя Вашей BMW")
    }

    override func doorStatusChange(_ doorState: String) {
        super.doorStatusChange(doorState)
        if doorsStatus == .open {
            print("Обязательно закройте двери перед тем, как начать движение!")
        } else {
            print("Двери закрыты, можно начать движение")
        }
    }
    
    override func windowStatusChange(_ windowsState: String) {
        super.windowStatusChange(windowsState)
        print("Помните: открытие окон во время движения может увеличить расход топлива!")
    }
    
}

class BMWVipSpecification: BMW {
    
    var remoteEngineStart: Bool
    var autoParking: Bool
    
   static var countVip = 0
    init(brand: String, yearOfManufacture: Int, color: UIColor, enginePower: Int, length: Double, height: Double, topSpeed: Int, km: Double, electricEngine: Bool, luggageCapacity: Double, accelerationTo100: Double, fuelType: FuelChange, doorsStatus: DoorsStatus, windowsStatus: WindowsStatus, mSpecification: Bool, upholsteryType: Upholstery, trimsType: Trims, windshieldType: Windshield, remoteEngineStart: Bool, autoParking: Bool) {
        self.autoParking = autoParking
        self.remoteEngineStart = remoteEngineStart
        BMWVipSpecification.countVip += 1
        super.init(brand: brand, yearOfManufacture: yearOfManufacture, color: color, enginePower: enginePower, length: length, height: height, topSpeed: topSpeed, km: km, electricEngine: electricEngine, luggageCapacity: luggageCapacity, accelerationTo100: accelerationTo100, fuelType: fuelType, doorsStatus: doorsStatus, windowsStatus: windowsStatus, mSpecification: mSpecification, upholsteryType: upholsteryType, trimsType: trimsType, windshieldType: windshieldType)
    }
    
   static func countBmwVipInfo(){
        print("Выпущено \(self.countVip) VIP машин BMW")
    }
    
    override func doorStatusChange(_ doorState: String) {
        super.doorStatusChange(doorState)
        print("Пиииип!")
    }
}

class TruckCar {
    
    let weight: Double
    let length: Double
    var km: Double
    var cargoMax: Double
    var extraSeats: Bool
    
    static var truckCount = 0
    init(weight: Double, length: Double, km: Double, cargoMax: Double, extraSeats: Bool){
        self.weight = weight
        self.length = length
        self.km = km
        self.cargoMax = cargoMax
        self.extraSeats = extraSeats
        TruckCar.truckCount += 1
    }
    
   static func truckCountInfo() {
        print("Выпущено \(self.truckCount) грузовиков")
    }
}

class Ambulance_Truck: TruckCar {
    
    var siren: Bool
    init(weight: Double, length: Double, km: Double, cargoMax: Double, extraSeats: Bool, siren: Bool){
        self.siren = siren
        super.init(weight: weight, length: length, km: km, cargoMax: cargoMax, extraSeats: extraSeats)
    }
    
    static func sirenOn(){
        print("иу-иу-иу-иу")
    }
}

var bmwX5 = BMW(brand: "BMW", yearOfManufacture: 2020, color: .black, enginePower: 250, length: 4, height: 2, topSpeed: 200, km: 0, electricEngine: false, luggageCapacity: 500, accelerationTo100: 5, fuelType: .petrol, doorsStatus: .closed, windowsStatus: .up, mSpecification: false, upholsteryType: .simpleBMW, trimsType: .simpleBMW, windshieldType: .simpleBMW)
var bmwX5_1: BMW? = BMW(brand: "BMW", yearOfManufacture: 2020, color: .black, enginePower: 250, length: 4, height: 2, topSpeed: 200, km: 0, electricEngine: false, luggageCapacity: 500, accelerationTo100: 5, fuelType: .petrol, doorsStatus: .closed, windowsStatus: .up, mSpecification: false, upholsteryType: .simpleBMW, trimsType: .simpleBMW, windshieldType: .simpleBMW)
var bmwX5_2: BMW? = BMW(brand: "BMW", yearOfManufacture: 2020, color: .black, enginePower: 250, length: 4, height: 2, topSpeed: 200, km: 0, electricEngine: false, luggageCapacity: 500, accelerationTo100: 5, fuelType: .petrol, doorsStatus: .closed, windowsStatus: .up, mSpecification: false, upholsteryType: .simpleBMW, trimsType: .simpleBMW, windshieldType: .simpleBMW)
var bmwX5_Vip: BMWVipSpecification = BMWVipSpecification(brand: "BMW", yearOfManufacture: 2020, color: .black, enginePower: 250, length: 4, height: 2, topSpeed: 200, km: 0, electricEngine: false, luggageCapacity: 500, accelerationTo100: 5, fuelType: .petrol, doorsStatus: .closed, windowsStatus: .up, mSpecification: false, upholsteryType: .simpleBMW, trimsType: .simpleBMW, windshieldType: .simpleBMW, remoteEngineStart: false, autoParking: true)
var truck_1 = TruckCar(weight: 4000, length: 9, km: 10000, cargoMax: 250000, extraSeats: false)
var amb_1 = Ambulance_Truck(weight: 1600, length: 5, km: 1000, cargoMax: 5000, extraSeats: false, siren: true)

bmwX5_1 = nil
bmwX5_2 = nil




bmwX5.fuelChange(1)
bmwX5.doorStatusChange("open")
bmwX5.windowStatusChange("open")
bmwX5.windshieldChange()
bmwX5.upholsteryChange(1)
bmwX5.trimsChange(1)
bmwX5.windshieldChange()
bmwX5.km = 100
print(bmwX5.fuelType)

bmwX5_Vip.doorStatusChange("open")

Ambulance_Truck.sirenOn()

Car.countInfo()
Car.brokenCountInfo()
TruckCar.truckCountInfo()
BMW.bmwCount()
BMWVipSpecification.countBmwVipInfo()
