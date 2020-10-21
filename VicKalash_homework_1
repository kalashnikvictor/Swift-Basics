import UIKit

//Добро пожаловать в "EQUATION CALCULATOR 1.0"

let equation = "a*(x^2)+b*x+c=0"
// введите коэффициенты a,b,c для уравнения, представленного выше
let a: Double = 1
let b: Double = 6
let c: Double = -7

let discriminant = Double(pow(Double(b), 2)-Double((4*a*c)))

if discriminant < 0 {
    print("Квадратное уравнение типа \(equation) с коэффициентами a=\(a), b=\(b), c=\(c)\nкорней не имеет, так как дискриминант < 0")
    
} else if discriminant == 0 {
    let root = (-Double(b)) / (2 * Double(a))
    print("Квадратное уравнение типа \(equation) с коэффициентами a=\(a), b=\(b), c=\(c)\nимеет единственный корень, равный \(root) так как дискриминант равен 0")
  } else {
        let rootA = (-Double(b) + sqrt(Double(discriminant))) / (2 * Double(a))
        let rootB = (-Double(b) - sqrt(Double(discriminant))) / (2 * Double(a))

        print("Квадратное уравнение типа \(equation) с коэффициентами a=\(a), b=\(b), c=\(c)\nбудет иметь корни \(rootA) и \(rootB)\n")
    }

/*Добро пожаловать в "TRIANGLE CALCULATOR 1.0"
введите величины катетов прямоугольного треугольника (legA и legB) для вычисления гипотенузы, периметра и площади*/

let legA: Double = 3
let legB: Double = 4
let hypothenuse = Double(sqrt((Double(pow(Double(legA), 2))) + (Double(pow(Double(legB), 2)))))
let perimeter = Double(legA) + Double(legB) + hypothenuse
let area = Double((legA * legB)/2)
print("Прямоугольный треугольник с катетами \(legA) и \(legB) будет иметь гипотенузу \(hypothenuse), периметр \(perimeter) и площадь \(area)\n")


/*Добро пожаловать в "DEPOSIT CALCULATOR 1.0"
введите предполагаемую сумму вклада, процент и количество лет для подсчета суммы вклада к концу предполагаемоего периода*/

let deposit: Double = 100000
let interest: Double = 8
let numberOfYears: Double = 5
let totalSum: Double = Double(deposit) * Double( pow( Double((1 + ((interest) / 100))), Double(numberOfYears)))
let totalSumStr = String(format: "%.2f", totalSum)
print("Сумма вашего вклада в размере \(deposit) при процентной ставке \(interest)% годовых с ежегодной капитализацией процентов через \(numberOfYears) лет составит \(totalSumStr)")


