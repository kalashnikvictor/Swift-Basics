import Foundation

//задача 1
let number = 5
func check() {
    if   number % 2 == 0 {
        print ("число \(number) четное\n")
    } else {
        print("число \(number) нечетное\n")
    }
}
check()


//задача 2
func checkThree() {
    if   number % 3 == 0 {
        print ("число \(number) делится на 3 без остатка\n")
    } else {
        print("число \(number) не делится на 3 без остатка\n")
    }
}
checkThree()

//задача 3
var array = [Int]()
for i in 1...100 {
    array.append(i)
}
print(array)


//задача 4
array = array.filter(){
    $0 % 2 != 0 && $0 % 3 == 0
}
print(array)


//задача 5
func arrayFibonacci(_ n:Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(arrayFibonacci(100))

//задача 6
var primeNumbers = [Int](2...100)
var p = 2
while p != 0 {
    for i in 2...100 {
        if let index = primeNumbers.firstIndex(of: (i * p)) {
            primeNumbers.remove(at: index)
        }
    }
    if let index = primeNumbers.firstIndex(of: p), index != (primeNumbers.endIndex - 1){
        p = primeNumbers[index + 1]
    } else {
        p = 0
    }
}
print(primeNumbers)

//задача 6 краткий вариант
func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))

