//
//  main.swift
//  FocusStartHomeworks
//
//  Created by Monday MeoW. on 17.10.2020.
//

import Foundation

var Cars = [Car]()

var userDefaults = UserDefaults.standard


func newCar(year : Int, manufacturer: String, model: String, body: Int, carNumber: String)  {
    let nCar = Car.init(year: year, manufacturer: manufacturer, model: model, body: body, carNumber: carNumber)
    Cars.append(nCar)
    
}
func deleteCar(id:Int)  {
    Cars.remove(at: id)
}
func updateCar(id:Int, year : Int, manufacturer: String, model: String, body: Int) {
    Cars[id].setYear(newYear: year)
    Cars[id].setManufacturer(newManufacturer: manufacturer)
    Cars[id].setModel(newModel: model)
    Cars[id].setBody(newBody: body)
}
func showCar(id:Int){
    let year = Cars[id].getYear()
    let manufacturer = Cars[id].getManufacturer()
    let model = Cars[id].getModel()
    let Body = Cars[id].getBody()
    
    print("Year         : ", year == -1 ? "-" : year,"\nManufacturer : ",manufacturer,"\nModel        : ",model,"\nBody type    : ",Body,"\n")
}
func filterIsTrue(id:Int,filterId:Int) -> Bool {
    return Cars[id].getBody() == Body(rawValue: filterId) ? true : false
}



func main()  {
    
    let count = Cars.count
    print("\n Available for viewing cars: ",count,"\n")
    var int : Int = 0
    var int1 : Int = 0
    var newYear: Int = 0
    var newManufacturer : String = ""
    var newModel : String = ""
    var newBody: Int = 0
    var newNumber : String = ""
    let countCars : Int = Int(Cars.count)-1
    print("Write number to choose action:\n1) show one car\n2) delete\n3) update\n4) new\n5) show all cars\n6) show cars with filters \n7) exit")
    
    if let str = readLine(){
        int = Int(str)!
    }
    switch  int {
    case 1:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        showCar(id: int1)
        main()
    case 2:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        deleteCar(id: int1)
        main()
    case 3:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        print("Year? Previos data:", Cars[int1].getYear())
        if let str = readLine(){
            newYear = Int(str)!
        }
        print("Manufacturer? Previos data:", Cars[int1].getManufacturer())
        newManufacturer = readLine()!
        print("Model? Previos data:", Cars[int1].getModel())
        newModel = readLine()!
        print("Body? Previos data:", Cars[int1].getBody())
        print("Body type? Please write number\nPrevios data:", Cars[int1].getBody())
        for body in Body.allCases {
            print(body.rawValue, " ", body)
        }
        if let str = readLine(){
            newBody = Int(str)!
        }
        
        updateCar(id: int1, year: newYear, manufacturer: newManufacturer, model: newModel, body: newBody)
        main()
    case 4:
        
        print("Year? ")
        if let str = readLine(){
            newYear = str == "" ? -1 : Int(str)!
        }
        print("Manufacturer? ")
        while newManufacturer == "" {
            newManufacturer = readLine()!
            if newManufacturer == "" {
                print("Missing value! Please enter Manufacturer\n")
            }
        }
        print("Model? ")
        while newModel == "" {
            newModel = readLine()!
            if newModel == "" {
                print("Missing value! Please enter Model\n")
            }
        }
        print("Body type? Please write number")
        for body in Body.allCases {
            print(body.rawValue, " ", body)
        }
        while (newBody > Body.allCases.count && newBody < 0){
            if let str = readLine(){
                newBody = Int(str)!
            }
            if (newBody > Body.allCases.count && newBody < 0) {
                print("Incorrect value! Please enter number of Body type between 0 and \(Body.allCases.count-1)\n")
            }
        }
        
        print("Country car number? ")
        newNumber = readLine()!
        
        newCar(year: newYear, manufacturer: newManufacturer, model: newModel, body: newBody, carNumber: newNumber)
        main()
    case 5:
        for i in 0...countCars {
            print("Car number \(i):")
            showCar(id: i)
        }
        main()
    case 6:
        print("Body type? Please write number")
        for body in Body.allCases {
            print(body.rawValue, " ", body)
        }
        if let str = readLine(){
            int1 = Int(str)!
        }
        for i in 0...countCars {
            if filterIsTrue(id: i, filterId: int1) {
                print("Car number \(i):")
                showCar(id: i)
            }
        }
        main()
        
        
    default: break
        
    }
}

newCar(year: -1, manufacturer: "Sith Empire", model: "Destroyer", body: 0, carNumber: "")
newCar(year: -1, manufacturer: "Roaling", model: "branch", body: 0, carNumber: "")
newCar(year: -1, manufacturer: "You", model: "Circle", body: 0, carNumber: "")
newCar(year: 2000, manufacturer: "Lincoln", model: "Town Car", body: 2, carNumber: "OL9139F")
newCar(year: 2016, manufacturer: "Mercedes-Benz", model: "S-Класс AMG Long III", body: 1, carNumber: "ABVGD")
newCar(year: 2013, manufacturer: "Kia", model: "Cerato Koup", body: 3, carNumber: "who knows?")
newCar(year: 2005, manufacturer: "Toyota", model: "Corolla", body: 4, carNumber: "kp264a33")
newCar(year: 1992, manufacturer: "Chevrolet", model: "Van", body: 5, carNumber: "beep-beep")

main()

