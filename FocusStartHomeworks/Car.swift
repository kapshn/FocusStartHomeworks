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

class Car{
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
    func setYear(newYear: Int?) {
        year = newYear
    }
    
    func setManufacturer(newManufacturer: String) {
        manufacturer = newManufacturer
    }
    
    func setModel(newModel: String) {
        model = newModel
    }
    
    func setBody(newBody: Int) {
        body = Body(rawValue: newBody) ?? Body.DIYcar
    }
    
    func setCarNumber(newNumber: String?)  {
        carNumber = newNumber
    }
    
    //Get func
    func getYear() -> Int {
		year ?? -1
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
