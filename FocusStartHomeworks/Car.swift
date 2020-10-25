//
//  Car.swift
//  FocusStartHomeworks
//
//  Created by Monday MeoW. on 17.10.2020.
//

import Foundation

enum Body: Int, CaseIterable {
    case  DIYcar, Sedan, Limousine, Coupe, Hatchback, Van
}

struct Car{
    private var year: Int?
    private var manufacturer: String
    private var model: String
    private var body: Body
    private var carNumber: String?
    
    init(year: Int?,
         manufacturer: String,
         model: String,
         body: Int,
         carNumber: String?) {
        self.year = year
        self.manufacturer = manufacturer
        self.model = model
        self.body = Body(rawValue: body) ?? Body.DIYcar
        self.carNumber = carNumber
    }
    
    //Set func
	mutating func setYear(newYear: Int?) {
        year = newYear
    }
    
	mutating func setManufacturer(newManufacturer: String) {
        manufacturer = newManufacturer
    }
    
	mutating func setModel(newModel: String) {
        model = newModel
    }
    
	mutating func setBody(newBody: Int) {
        body = Body(rawValue: newBody) ?? Body.DIYcar
    }
    
	mutating func setCarNumber(newNumber: String?)  {
        carNumber = newNumber
    }
    
    //Get func
    func getYear() -> Int? {
		year
    }
    
    func getManufacturer() -> String {
		manufacturer
    }
    
    func getModel() -> String {
		model
    }
    
    func getBody() -> Body {
		body
    }
}
