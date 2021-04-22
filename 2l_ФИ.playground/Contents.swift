import UIKit

//Проверка четности числа

func evenNumbers(num: Int) -> String {
    if num % 2 == 0{
        print("Число \(num) четное")}
    else {
        print("Число \(num) нечетное")}
    return String(num)
}

evenNumbers(num: 4)
evenNumbers(num: 26)
evenNumbers(num: 155)

//Проверка деления без остатка

func divideNumbers(num: Int) -> String {
    if num % 3 != 0{
        print("Число \(num) делится на 3 с остатком.")
    } else {
        print("Число \(num) делится на 3 без остатка.")
    }
    return String(num)
}

divideNumbers(num: 10)
divideNumbers(num: 66)
divideNumbers(num: 134)

//Возрастающий массив

var massNumber = [Int] (1...100)
print(massNumber)

// Удаление чисел из массива
for (index, value) in massNumber.enumerated(){
    if (value % 2) == 0 {
        massNumber.remove(at: massNumber.firstIndex(of: value)!)
    } else if (value % 3) == 0{
        massNumber.remove(at: massNumber.firstIndex(of: value)!)
    }
}
print(massNumber)

//*Функция добавления числа Фибоначчи. Добавить массив из 50 элементов
func fibonachi(n: Int) -> [Int] {
    
    var fibo = [0, 1]
    
    while fibo.count < n {
        fibo.append(fibo[fibo.count - 1] + fibo[fibo.count - 2])
    }
    return fibo
}

print(fibonachi(n: 50))

//*Заполнить массив из 100 элементов простыми числами.

var cNumber = [Int] (2...300)
var p = 2
var g = 3
for (value) in cNumber {
    if (value % p) == 0 && (value) != p {
        cNumber.remove(at: cNumber.firstIndex(of: value)!)
    } else if (value % g) == 0 {
            cNumber.remove(at: cNumber.firstIndex(of: value)!)
    }
}
cNumber.count

print(cNumber)

