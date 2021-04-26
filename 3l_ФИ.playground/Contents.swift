import UIKit

//Перечисления действий
enum windowPosition {
    case open, close
}
enum conditionsEngine {
    case start, stop
}
enum volumePoint{
    case trunkVolume (litre: Int)
    case bodyVolume (litre: Int)
}


//Структура авто
struct sportCars{
    var brand: String = " "
    var releaseYear: Int
    var trunkCapacity: Int
    var conditionsEngine: conditionsEngine
    var windowPosition: windowPosition
    var occupancyTrunk: Int
    
    func description(){
        print("Спорткар \(brand), \(releaseYear) года выпуска, объем багажника: \(trunkCapacity) литров, в данный момент двигатель: \(conditionsEngine), окна: \(windowPosition), ,багажник заполнен на: \(occupancyTrunk) литров")
    }
    mutating func windowOpen (){
        self.windowPosition = .open
    }
    mutating func windowClose (){
        self.windowPosition = .close
    }
    mutating func startEngine (){
        self.conditionsEngine = .start
    }
    mutating func stopEngine (){
        self.conditionsEngine = .stop
    }
    mutating func loadingCargo (sizeCargo: Int){
        self.occupancyTrunk += sizeCargo
    }
    mutating func unloadingCargo (sizeCargo: Int){
        self.occupancyTrunk -= sizeCargo
    }
}

var sportCar1 = sportCars(brand: "Lamborghini Huracan",releaseYear: 2019, trunkCapacity: 250, conditionsEngine: .start, windowPosition: .close, occupancyTrunk: 0)
var sportCar2 = sportCars(brand: "Audi RS Q8",releaseYear: 2019, trunkCapacity: 150, conditionsEngine: .start, windowPosition: .open, occupancyTrunk: 0)
var sportCar3 = sportCars(brand: "Porsche 718 Cayman GTS",releaseYear: 2017, trunkCapacity: 200, conditionsEngine: .stop, windowPosition: .open, occupancyTrunk: 0)


struct trunkCars{
    var brand: String = " "
    var releaseYear: Int
    var trunkCapacity: Int
    var conditionsEngine: conditionsEngine
    var windowPosition: windowPosition
    var occupancyTrunk: Int
    
    func description(){
        print("Грузовой автомобиль \(brand), \(releaseYear) года выпуска, объем кузова: \(trunkCapacity) литров, в данный момент двигатель: \(conditionsEngine), окна: \(windowPosition), ,кузов заполнен на: \(occupancyTrunk) литров")
    }
    mutating func windowOpen (){
        self.windowPosition = .open
    }
    mutating func windowClose (){
        self.windowPosition = .close
    }
    mutating func startEngine (){
        self.conditionsEngine = .start
    }
    mutating func stopEngine (){
        self.conditionsEngine = .stop
    }
    mutating func loadingCargo (sizeCargo: Int){
        self.occupancyTrunk += sizeCargo
    }
    mutating func unloadingCargo (sizeCargo: Int){
        self.occupancyTrunk -= sizeCargo
    }
}

var trunkCar1 = trunkCars(brand: "Isuzu Forward",releaseYear: 2011, trunkCapacity: 2000, conditionsEngine: .stop, windowPosition: .close, occupancyTrunk: 0)
var trunkCar2 = trunkCars(brand: "Mersedes-Benz Atego",releaseYear: 2014, trunkCapacity: 1218, conditionsEngine: .start, windowPosition: .open, occupancyTrunk: 0)
var trunkCar3 = trunkCars(brand: "Камаз 65801",releaseYear: 2021, trunkCapacity: 2500, conditionsEngine: .start, windowPosition: .open, occupancyTrunk: 0)

sportCar1.description()

sportCar1.windowOpen()
sportCar1.loadingCargo(sizeCargo: 175)
sportCar1.description()

sportCar1.unloadingCargo(sizeCargo: 63)
sportCar1.description()

sportCar2.windowClose()
sportCar2.loadingCargo(sizeCargo: 38)
sportCar2.description()

trunkCar1.description()
trunkCar1.windowOpen()
trunkCar1.startEngine()

trunkCar1.description()

trunkCar2.description()
trunkCar2.loadingCargo(sizeCargo: 1218)
trunkCar2.windowClose()
trunkCar2.stopEngine()

trunkCar2.description()

//Для собственного развития
if trunkCar2.occupancyTrunk == trunkCar2.trunkCapacity {
    print("Двигатель \(conditionsEngine.start)")
    print("Окна \(windowPosition.close)")
    print("Загрузились! Пора ехать!")
} else if trunkCar2.occupancyTrunk > trunkCar2.trunkCapacity {
    print("Не поедем! Перегруз!")
} else {
    print("Можно загрузить еще \(trunkCar2.trunkCapacity - trunkCar2.occupancyTrunk)")
}

