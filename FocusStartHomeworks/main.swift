//
//  main.swift
//  FocusStartHomeworks
//
//  Created by Monday MeoW. on 17.10.2020.
//

import Foundation

var Cars = [Car]()

func newCar(year: Int?,
            manufacturer: String,
            model: String,
            body: Int,
            carNumber: String) {
    let nCar = Car.init(year: year,
                        manufacturer: manufacturer,
                        model: model,
                        body: body,
                        carNumber: carNumber)
    Cars.append(nCar)
}

func deleteCar(id: Int)  {
    Cars.remove(at: id)
}

func updateCar(id: Int,
               year: Int?,
               manufacturer: String,
               model: String,
               body: Int) {
    Cars[id].setYear(newYear: year)
    Cars[id].setManufacturer(newManufacturer: manufacturer)
    Cars[id].setModel(newModel: model)
    Cars[id].setBody(newBody: body)
}

func showCar(id: Int){
    let year = Cars[id].getYear()
    let manufacturer = Cars[id].getManufacturer()
    let model = Cars[id].getModel()
    let Body = Cars[id].getBody()
    
    print("Year         : ", year == -1 ? "-" : year,
          "\nManufacturer : ", manufacturer,
          "\nModel        : ", model,
          "\nBody type    : ", Body, "\n")
}

func filterIsTrue(id: Int, filterId: Int) -> Bool {
    return Cars[id].getBody() == Body(rawValue: filterId) ? true : false
}

func readInt() -> Int? {
	if let str = readLine(){
		return Int(str)
	}
	return nil
}

func main()  {
    let count = Cars.count
    let countCars: Int = Int(Cars.count)-1
    
    var menuSwitchCase: Int?
    var carID: Int?
    var newYear: Int?
    var newManufacturer: String = ""
    var newModel: String = ""
    var newBody: Int?
    var newNumber: String = ""
    
    print("\n Available for viewing cars: ",count,"\n")
    print("Write number to choose action:\n1) show one car\n2) delete\n3) update\n4) new\n5) show all cars\n6) show cars with filters \n7) exit")
	while menuSwitchCase ?? 0 < 1 {
		menuSwitchCase = readInt()
		if menuSwitchCase ?? 0 < 1 {
			print("Incorrect value! Please enter number between 1 and 7")
		}
	}
    
    switch  menuSwitchCase {
    case 1:
        print("which one? from 0 to ", countCars)
		while (!(carID ?? -1 < count && carID ?? -1 >= 0)){
			carID = readInt()
			if (!(carID ?? -1 > count || carID ?? -1 < 0)) {
				print("Incorrect value! Please enter number from 0 to ", countCars)
			}
		}
		showCar(id: carID!)
        main()
        
    case 2:
        print("which one? from 0 to ", countCars)
		while (!(carID ?? -1 < count && carID ?? -1 >= 0)){
			carID = readInt()
			if (!(carID ?? -1 > count || carID ?? -1 < 0)) {
				print("Incorrect value! Please enter number from 0 to ", countCars)
			}
		}
        deleteCar(id: carID!)
        main()
        
    case 3:
        print("which one? from 0 to ", countCars)
		while (!(carID ?? -1 < count && carID ?? -1 >= 0)){
			carID = readInt()
			if (!(carID ?? -1 > count || carID ?? -1 < 0)) {
				print("Incorrect value! Please enter number from 0 to ", countCars)
			}
		}
        print("Year? Previos data:", Cars[carID!].getYear())
        if let str = readLine(){
            newYear = Int(str)!
        }
        print("Manufacturer? Previos data:", Cars[carID!].getManufacturer())
        newManufacturer = readLine()!
        print("Model? Previos data:", Cars[carID!].getModel())
        newModel = readLine()!
        print("Body? Previos data:", Cars[carID!].getBody())
        print("Body type? Please write number\nPrevios data:", Cars[carID!].getBody())
        for body in Body.allCases {
            print(body.rawValue, " ", body)
        }
		while (!(newBody ?? -1 < Body.allCases.count && newBody ?? -1 >= 0)){
			newBody = readInt()
			if (!(newBody ?? -1 > Body.allCases.count || newBody ?? -1 < 0)) {
				print("Incorrect value! Please enter number of Body type between 0 and \(Body.allCases.count-1)\n")
			}
		}
        updateCar(id: carID!,
                  year: newYear,
                  manufacturer: newManufacturer,
                  model: newModel,
                  body: newBody!)
        main()
        
    case 4:
        print("Year? ")
		newYear = readInt()

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
		while (!(newBody ?? -1 < Body.allCases.count && newBody ?? -1 >= 0)){
			newBody = readInt()
			if (!(newBody ?? -1 > Body.allCases.count || newBody ?? -1 < 0)) {
				print("Incorrect value! Please enter number of Body type between 0 and \(Body.allCases.count-1)\n")
			}
		}
        
        print("Country car number? ")
        newNumber = readLine()!
        
        newCar(year: newYear,
               manufacturer: newManufacturer,
               model: newModel,
               body: newBody!,
               carNumber: newNumber)
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
		while (!(newBody ?? -1 < Body.allCases.count && newBody ?? -1 >= 0)){
			newBody = readInt()
			if (!(newBody ?? -1 > Body.allCases.count || newBody ?? -1 < 0)) {
				print("Incorrect value! Please enter number of Body type between 0 and \(Body.allCases.count-1)\n")
			}
		}
        for i in 0...countCars {
            if filterIsTrue(id: i, filterId: newBody!) {
                print("Car number \(i):")
                showCar(id: i)
            }
        }
        main()
        
    default: break
    }
}

newCar(year: nil, manufacturer: "Sith Empire", model: "Destroyer", body: 0, carNumber: "")
newCar(year: nil, manufacturer: "Roaling", model: "branch", body: 0, carNumber: "")
newCar(year: nil, manufacturer: "You", model: "Circle", body: 0, carNumber: "")
newCar(year: 2000, manufacturer: "Lincoln", model: "Town Car", body: 2, carNumber: "OL9139F")
newCar(year: 2016, manufacturer: "Mercedes-Benz", model: "S-Класс AMG Long III", body: 1, carNumber: "ABVGD")
newCar(year: 2013, manufacturer: "Kia", model: "Cerato Koup", body: 3, carNumber: "who knows?")
newCar(year: 2005, manufacturer: "Toyota", model: "Corolla", body: 4, carNumber: "kp264a33")
newCar(year: 1992, manufacturer: "Chevrolet", model: "Van", body: 5, carNumber: "beep-beep")

main()

