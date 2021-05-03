import UIKit

enum windowPosition {
    case open, close
}
enum conditionsEngine {
    case start, stop
}

protocol Car {
    var brand: String {get set}
    var releaseYear: Int {get set}
    var trunkCapacity: Int {get set}
    var conditionsEngine: conditionsEngine {get set}
    var windowPosition: windowPosition {get set}
    var occupancyTrunk: Int {get set}
    
    func printDescription()
}

extension Car{
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

class SportCar: Car {
    var brand: String
    
    var releaseYear: Int
    
    var trunkCapacity: Int
    
    var conditionsEngine: conditionsEngine
    
    var windowPosition: windowPosition
    
    var occupancyTrunk: Int
    
    enum enginePlace{
        case Front, Behind
    }
    enum hatch{
        case open, close
    }
    var hatch: hatch
    
    var enginePlace: enginePlace
    
    func printDescription() {
        print(description)
    }
    
    init (brand: String, releaseYear: Int, trunkCapacity: Int, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: Int, hatch: hatch, enginePlace: enginePlace){
        self.brand = brand
        self.releaseYear = releaseYear
        self.trunkCapacity = trunkCapacity
        self.conditionsEngine = conditionsEngine
        self.windowPosition = windowPosition
        self.occupancyTrunk = occupancyTrunk
        self.hatch = hatch
        self.enginePlace = enginePlace
    }
}

class TrunkCar: Car {
    var brand: String
    
    var releaseYear: Int
    
    var trunkCapacity: Int
    
    var conditionsEngine: conditionsEngine
    
    var windowPosition: windowPosition
    
    var occupancyTrunk: Int
    
    func printDescription() {
        print(description)
    }
    
    enum cabineType {
        case Hood, Cabless
    }
    enum trunckPosition {
        case open, close
    }
    enum trunckType {
        case SideBody, FullMetal, Tent
    }
    
    var trunckType: trunckType
    
    var cabineType: cabineType
    
    var trunckPosition: trunckPosition
    
    init (brand: String, releaseYear: Int, trunkCapacity: Int, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: Int,trunckPosition: trunckPosition, trunckType: trunckType, cabineType: cabineType){
        self.brand = brand
        self.releaseYear = releaseYear
        self.trunkCapacity = trunkCapacity
        self.conditionsEngine = conditionsEngine
        self.windowPosition = windowPosition
        self.occupancyTrunk = occupancyTrunk
        self.trunckPosition = trunckPosition
        self.trunckType = trunckType
        self.cabineType = cabineType
    }
}

extension SportCar: CustomStringConvertible {
    var description: String{
    return "Спорткар: \(brand), \(releaseYear) года выпуска;\nОбъем багажника: \(trunkCapacity) литров;\nПоложение двигателя \(self.enginePlace), в данный момент он: \(conditionsEngine);\nОкна: \(windowPosition), а также люк \(self.hatch);\nБагажник заполнен на: \(occupancyTrunk) литров\n"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String{
        return "Грузовой автомобиль: \(brand), \(releaseYear) года выпуска;\nТип кабины: \(self.cabineType);\nТип кузова: \(self.trunckType), его объем: \(trunkCapacity) литров;\nВ данный момент двигатель: \(conditionsEngine);\nОкна: \(windowPosition);\nБагажник заполнен на: \(occupancyTrunk) литров и \(self.trunckPosition)\n"
    }
}

var ferrari = SportCar(brand: "Ferrari", releaseYear: 2017, trunkCapacity: 250, conditionsEngine:.start, windowPosition: .close, occupancyTrunk: 0, hatch: .close, enginePlace: .Behind)

var audi = SportCar(brand: "Audi", releaseYear: 2020, trunkCapacity: 250, conditionsEngine: .stop, windowPosition: .open, occupancyTrunk: 0, hatch: .open, enginePlace: .Front)

var isuzu = TrunkCar(brand: "Isuzu", releaseYear: 2016, trunkCapacity: 2080, conditionsEngine: .start, windowPosition: .close, occupancyTrunk: 0, trunckPosition: .close, trunckType: .FullMetal, cabineType: .Cabless)

var mersedes = TrunkCar(brand: "Mersedes-Benz", releaseYear: 2021, trunkCapacity: 2180, conditionsEngine: .stop, windowPosition: .open, occupancyTrunk: 0, trunckPosition: .open, trunckType: .SideBody, cabineType: .Hood)

ferrari.printDescription()
ferrari.windowOpen()
ferrari.loadingCargo(sizeCargo: 50)
ferrari.printDescription()


isuzu.printDescription()
isuzu.windowOpen()
isuzu.stopEngine()
isuzu.printDescription()

mersedes.loadingCargo(sizeCargo: 600)
mersedes.windowClose()
mersedes.startEngine()
mersedes.printDescription()


