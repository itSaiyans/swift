import UIKit

//"Решение уравнения: a(x^2) + bx + c"

let a: Double = 2
let b: Double = 7
let c: Double = 3

let D = b * b - 4 * a * c

if D > 0 {
    let x1: Double = (-b + sqrt(D)) / (2 * a)
    let x2: Double = (-b - sqrt(D)) / (2 * a)
    print("Корни уравнения: X1 = \(x1); X2 = \(x2)" )
} else if D == 0 {
    let x1: Double = -b / (2 * a)
    print("Уравнение имеет один корень: X = \(x1)")
} else if D < 0 {
    print("Не имеет решения")
}

//Гипотенуза, площадь и периметр треугольника

let cathetA: Float = 10
let cathetB: Float = 9

let hypotenuse = sqrt((cathetA * cathetA) + (cathetB * cathetB))

let P = cathetA + cathetB + hypotenuse

let S = (cathetA * cathetB) / 2

print("Гипотенуза = \(hypotenuse), Периметр = \(P), Площадь = \(S).")

//*Найти сумму вклада через 5 лет

var rub: Double = 10000
var percent: Double = 3.5
var years = 1

while years <= 5 {
    let onePercent = rub / 100
    let income = onePercent * percent
    rub = rub + income
    years += 1
}
print("Через 5 лет, ваша сумма вклада будет равна: \(String(format: "%.2f", rub))")
