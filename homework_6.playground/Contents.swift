import UIKit

enum CarBrand {
    case BMW, Mersedes, Audi, Porsche, Opel, Volkswagen
}

protocol CarPrice {
    var carPrice: Int {get}
}

class Car: CarPrice {
    var brand: CarBrand
    var carPrice: Int
    init(carBrand: CarBrand, carPrice: Int){
        self.brand = carBrand
        self.carPrice = carPrice
    }
}

extension Car: CustomStringConvertible{
    var description: String {
        return "Машина марки \(brand) ценой в \(carPrice)"
    }
}

struct Queue<T: CarPrice>{
    
    var list = [T]()
    
    mutating func enqueue (_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    mutating func peak() -> T? {
        if !list.isEmpty {
            return list[0]
        } else {
            return nil
        }
    }
    
    var totalPrice: Int {
        var price = 0
        for element in list {
            price += element.carPrice
        }
        return price
    }
    
    subscript (_ elements: Int...) -> Int {
        var totalPrice = 0
        for index in elements where index < self.list.count {
            totalPrice += self.list[index].carPrice
        }
        return totalPrice
    }
    
    /*func customFilter(_ condiiton: (T) -> Bool) ->[T] {
        var result = [T]()
        for car in list {
            if condiiton(car) {
                result.append(car)
            }
        }
        return result
    }*/

}
extension Queue: CustomStringConvertible{
    var description: String {
        return "\(list)"
    }
}
var carDealership = Queue<Car>()

carDealership.enqueue(Car(carBrand: .Audi, carPrice: 1000))
carDealership.enqueue(Car(carBrand: .BMW, carPrice: 1050))
carDealership.enqueue(Car(carBrand: .Mersedes, carPrice: 1100))
carDealership.enqueue(Car(carBrand: .Opel, carPrice: 800))
carDealership.enqueue(Car(carBrand: .Porsche, carPrice: 1300))
carDealership.enqueue(Car(carBrand: .Volkswagen, carPrice: 900))
carDealership.enqueue(Car(carBrand: .Audi, carPrice: 1500))
carDealership.enqueue(Car(carBrand: .Audi, carPrice: 1200))
print("цена всех машин у данного диллера составляет \(carDealership.totalPrice)")
print("общая цена машин: \(carDealership.list[1]) , \(carDealership.list[3]), \(carDealership.list[5]) равна \(carDealership [1,3,5])")
carDealership.dequeue()
print(carDealership.list.filter{$0.carPrice < 999})
print(carDealership.list.filter{$0.brand == .Audi})
carDealership.list.sort{$0.carPrice > $1.carPrice}
print(carDealership)
carDealership [10]
//print(carDealership.customFilter{$0.carPrice < 999})
//print(carDealership.customFilter{$0.brand == .Audi})



