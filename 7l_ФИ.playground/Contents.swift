import UIKit
//1. if let, guard let
enum loginError: Error {
    case incorrectPass
    case accountNotExist
    case accountBlocked
}

struct user {
    var username: String
    var password: String
    var accauntBlock: Bool
}

class userBase {
    var inventory = [
        "Stas": user(username: "Stas", password: "Y12345", accauntBlock: false),
        "Oleg": user(username: "Oleg", password: "Qwerty123", accauntBlock: true),
        "Ksenya":user(username: "Ksenya", password: "Ksu88790", accauntBlock: false)
    ]
    
    func logIn (username: String, password: String) -> (user? , loginError?) {
        guard let user = inventory[username] else {
            return (nil, loginError.accountNotExist)
        }
        guard user.password == password else{
            return (nil, loginError.incorrectPass)
        }
        guard user.accauntBlock == false else {
            return (nil, loginError.accountBlocked)
        }
        return(user, nil)
    }
}
let logInFunc = userBase()

let firstUser = logInFunc.logIn(username: "Stas", password: "Y12345")
let secondUser = logInFunc.logIn(username: "Max", password: "Max1111")
let thirdUser = logInFunc.logIn(username: "Oleg", password: "Qwerty123")
let fourthUser = logInFunc.logIn(username: "Ksenya", password: "Ksen8890")

if firstUser.0 != nil {
    print("Авторизация пользователя прошла успешно")
} else if firstUser.1 != nil {
    print("Ошибка")
}

//2. throws функции, реализация try/catch
var rom: Double = 64
var programm: Double = 5

enum updateError: Error {
    case requestTimeOut(Error: Int)
    case fileNotFound
    case notEnoughMemory
}

struct File {
    var name: String
    var size: Double
}

class softwareUpdate {
    var downloadableFile = ["Update.pkg": File(name: "Update.pkg", size: 1.2)]
    let connectServer = 0
    
    func downloadUpdate (name: String, connectSrv: Int) throws {
        guard let File = downloadableFile[name] else {
            throw updateError.fileNotFound
        }
        
        let programmSize = programm + File.size
        
        guard programmSize < rom else {
            throw updateError.notEnoughMemory
        }
        
        guard connectServer != 408 else {
            throw updateError.requestTimeOut(Error: connectSrv)
        }
        print("Файл \(File.name) загружен, обновление завершено.")
    }
}

let storageP = [
    "bin":"Update.pkg",
    "log":"ChangeLogs.txt"
]

func updating(storage:String, funcUpdate:softwareUpdate) throws {
    let connectServer = 200
    let storageFolder = storageP[storage] ?? ""
    return try funcUpdate.downloadUpdate(name: storageFolder, connectSrv: connectServer)
}

do {
    try updating(storage: "bin", funcUpdate: softwareUpdate())
} catch updateError.requestTimeOut(let errorCode) {
    print(errorCode)
} catch updateError.fileNotFound {
    print("Файл не найден")
} catch updateError.notEnoughMemory {
    print("Недостаточно памяти")
}

do {
    try updating(storage: "log", funcUpdate: softwareUpdate())
} catch updateError.requestTimeOut(let errorCode) {
    print(errorCode)
} catch updateError.fileNotFound {
    print("Файл не найден")
} catch updateError.notEnoughMemory {
    print("Недостаточно памяти")
}


