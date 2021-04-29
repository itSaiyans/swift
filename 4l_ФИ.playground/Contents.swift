import UIKit

enum windowPosition {
    case open, close
}
enum conditionsEngine {
    case start, stop
}


class Car {
    var brand: String = " "
    var releaseYear: Int
    var trunkCapacity: Int
    var conditionsEngine: conditionsEngine
    var windowPosition: windowPosition
    var occupancyTrunk: Int
    
    init (brand: String, releaseYear: Int, trunkCapacity: Int, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: Int){
        self.brand = brand
        self.releaseYear = releaseYear
        self.trunkCapacity = trunkCapacity
        self.conditionsEngine = conditionsEngine
        self.windowPosition = windowPosition
        self.occupancyTrunk = occupancyTrunk
    }
    func description(){
        print("Автомобиль \(brand), \(releaseYear) года выпуска, объем багажника: \(trunkCapacity) литров, в данный момент двигатель: \(conditionsEngine), окна: \(windowPosition), ,багажник заполнен на: \(occupancyTrunk) литров\n")
    }
    func windowOpen (){
        self.windowPosition = .open
    }
    func windowClose (){
        self.windowPosition = .close
    }
    func startEngine (){
        self.conditionsEngine = .start
    }
    func stopEngine (){
        self.conditionsEngine = .stop
    }
    func loadingCargo (sizeCargo: Int){
        self.occupancyTrunk += sizeCargo
    }
    func unloadingCargo (sizeCargo: Int){
        self.occupancyTrunk -= sizeCargo
    }
        
}
class SportCar: Car {
    enum enginePlace{
        case Front, Behind
    }
    enum hatch{
        case open, close
    }
    var hatch: hatch
    var enginePlace: enginePlace
    
    init (brand: String, releaseYear: Int, trunkCapacity: Int, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: Int, hatch: hatch, enginePlace: enginePlace){
        self.hatch = hatch
        self.enginePlace = enginePlace
        
        super.init(brand: brand, releaseYear: releaseYear, trunkCapacity: trunkCapacity, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: occupancyTrunk)
    }
   override func description(){
    print("Спорткар: \(brand), \(releaseYear) года выпуска;\nОбъем багажника: \(trunkCapacity) литров;\nПоложение двигателя \(self.enginePlace), в данный момент он: \(conditionsEngine);\nОкна: \(windowPosition), а также люк \(self.hatch);\nБагажник заполнен на: \(occupancyTrunk) литров\n")
        }
    override func windowOpen() {
        self.windowPosition = .open
        self.hatch = .open
        print("Окна и люк открыты")
    }
    override func windowClose (){
        self.windowPosition = .close
        self.hatch = .close
        print("Окна и люк закрыты")
    }
}



class TrunkCar: Car{
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
        self.trunckPosition = trunckPosition
        self.trunckType = trunckType
        self.cabineType = cabineType
        
        super.init(brand: brand, releaseYear: releaseYear, trunkCapacity: trunkCapacity, conditionsEngine: conditionsEngine, windowPosition: windowPosition, occupancyTrunk: occupancyTrunk)
    }
    override func description(){
        print("Грузовой автомобиль: \(brand), \(releaseYear) года выпуска;\nТип кабины: \(self.cabineType);\nТип кузова: \(self.trunckType), его объем: \(trunkCapacity) литров;\nВ данный момент двигатель: \(conditionsEngine);\nОкна: \(windowPosition);\nБагажник заполнен на: \(occupancyTrunk) литров и \(self.trunckPosition)\n")
         }
    override func loadingCargo (sizeCargo: Int){
        self.occupancyTrunk += sizeCargo
        switch trunkCapacity {
        case _ where trunkCapacity == occupancyTrunk:
            self.trunckPosition = .close
            print("Товар загружен. Кузов закрыт")
        default:
        self.trunckPosition = .open
            print("Кузов неполный. Загрузите ещё!")
        }
    }
    override func unloadingCargo (sizeCargo: Int){
        self.occupancyTrunk -= sizeCargo
        switch trunkCapacity {
        case _ where occupancyTrunk == 0:
            self.trunckPosition = .close
            print("Товар выгружен, кузов закрыт")
        default:
            self.trunckPosition = .open
            print("Идет разгрузка осталось \(occupancyTrunk)")
        }
    }
}


var ferrari = SportCar(brand: "Ferrari", releaseYear: 2018, trunkCapacity: 250, conditionsEngine: .start, windowPosition: .close, occupancyTrunk: 0, hatch: .open, enginePlace: .Behind)

var audi = SportCar(brand: "Audi", releaseYear: 2019, trunkCapacity: 230, conditionsEngine: .stop, windowPosition: .open, occupancyTrunk: 0, hatch: .open, enginePlace: .Front)

var kamaz = TrunkCar(brand: "Камаз", releaseYear: 2021, trunkCapacity: 2180, conditionsEngine: .start, windowPosition: .open, occupancyTrunk: 0, trunckPosition: .close, trunckType: .FullMetal, cabineType: .Cabless)

var mercedes = TrunkCar(brand: "Mercedes-Benz", releaseYear: 2017, trunkCapacity: 2500, conditionsEngine: .stop, windowPosition: .close, occupancyTrunk: 0, trunckPosition: .open, trunckType: .SideBody, cabineType: .Hood)


ferrari.description()
kamaz.description()
audi.description()
mercedes.description()

audi.windowClose()
ferrari.stopEngine()
ferrari.windowOpen()

kamaz.loadingCargo(sizeCargo: 2180)

mercedes.loadingCargo(sizeCargo: 1500)
mercedes.unloadingCargo(sizeCargo: 380)

