import UIKit

enum CarStartErrors: Error {
    case batteryIsLow
    case noFuel
    case alarmIsOn
    case noKey
}

class Car {
    var batteryStatus: Int
    var fuelAmount: Int
    var alarmStatus: Bool
    var keyStatus: Bool
    init(batteryStatus: Int, fuelAmount: Int, alarmStatus: Bool, keyStatus: Bool){
        self.batteryStatus = batteryStatus
        self.fuelAmount = fuelAmount
        self.alarmStatus = alarmStatus
        self.keyStatus = keyStatus
    }
    
    func carStart() throws -> String {
        guard batteryStatus > 3 else { throw CarStartErrors.batteryIsLow }
        guard fuelAmount > 1 else { throw CarStartErrors.noFuel}
        guard !alarmStatus == true else { throw CarStartErrors.alarmIsOn}
        guard !keyStatus == false else { throw CarStartErrors.noKey}
        let result = "Двигатель включен. Можно начать движение"
        print(result)
        return result
    }
}

var bmw = Car(batteryStatus: 0, fuelAmount: 100, alarmStatus: false, keyStatus: true)
//try bmw.carStart()
   
do { try bmw.carStart()
    } catch CarStartErrors.batteryIsLow {
        print("Аккумулятор разряжен. Замените или зарядите аккумулятор")
    } catch CarStartErrors.noFuel {
        print("Закончился бензин. Заправьтесь!")
    } catch CarStartErrors.alarmIsOn {
        print("Машина на сигнализации, двигатель не запустится! Снимите машину с сигнализации")
    } catch CarStartErrors.noKey {
        print("Машина не видит ключ! Нужен ключ!")
    } catch let error {
        print(error.localizedDescription)}

    
do { var audi = try Car(batteryStatus: 90, fuelAmount: 0, alarmStatus: false, keyStatus: true).carStart()
    } catch CarStartErrors.batteryIsLow {
        print("Аккумулятор разряжен. Замените или зарядите аккумулятор")
    } catch CarStartErrors.noFuel {
        print("Закончился бензин. Заправьтесь!")
    } catch CarStartErrors.alarmIsOn {
        print("Машина на сигнализации, двигатель не запустится! Снимите машину с сигнализации")
    } catch CarStartErrors.noKey {
        print("Машина не видит ключ! Нужен ключ!")
    } catch let error {
        print(error.localizedDescription)}

do { var mersedes = try Car(batteryStatus: 90, fuelAmount: 70, alarmStatus: true, keyStatus: true).carStart()
    } catch CarStartErrors.batteryIsLow {
        print("Аккумулятор разряжен. Замените или зарядите аккумулятор")
    } catch CarStartErrors.noFuel {
        print("Закончился бензин. Заправьтесь!")
    } catch CarStartErrors.alarmIsOn {
        print("Машина на сигнализации, двигатель не запустится! Снимите машину с сигнализации")
    } catch CarStartErrors.noKey {
        print("Машина не видит ключ! Нужен ключ!")
    } catch let error {
        print(error.localizedDescription)}

do { var mersedes = try Car(batteryStatus: 90, fuelAmount: 70, alarmStatus: false, keyStatus: false).carStart()
    } catch CarStartErrors.batteryIsLow {
        print("Аккумулятор разряжен. Замените или зарядите аккумулятор")
    } catch CarStartErrors.noFuel {
        print("Закончился бензин. Заправьтесь!")
    } catch CarStartErrors.alarmIsOn {
        print("Машина на сигнализации, двигатель не запустится! Снимите машину с сигнализации")
    } catch CarStartErrors.noKey {
        print("Машина не видит ключ! Нужен ключ!")
    } catch let error {
        print(error.localizedDescription)}

