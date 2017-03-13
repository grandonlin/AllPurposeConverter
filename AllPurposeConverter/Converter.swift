//
//  Converter.swift
//  AllPurposeConverter
//
//  Created by Grandon Lin on 2016-11-22.
//  Copyright © 2016 Grandon Lin. All rights reserved.
//

import Foundation

class Converter {
    private var _unitTitle: String!
    var sourceArray: [String]!
    var Numerator: Double!
    var Denominator: Double!
    var ratio: Double! = 1.0
    
    let lengthArray = ["Miles", "Kilometers", "Meters", "Decimeters", "Centimeters", "Millimeters",  "Feet", "Inches"]
    let weightArray = ["Ton", "Kilogram", "Pound", "Milligram", "Gram", "Ounce"]
    let areaArray = ["Sq Miles", "Sq Kilometers","Hides", "Hectares", "Acres", "Roods","Ares", "Sq Meters", "Sq Yards", "Sq Feet", "Sq Centimeters","Sq Inches"]
    let tempArray = ["Celsius", "Fahrenheit", "Kelvin", "Rankine"]
    let volumeArray = ["Liter", "Milliliters", "Kiloleters", "Gallons(US)", "Quarts(US)", "Pints(US)", "Fl Ounce(US)", "Gallons(Imperial)", "Quarts(Imperial)", "Pints(Imperial)", "Fl Ounce(Imperial)", "Cups", "Tablespoons", "Centiliters", "Teaspoons"]
    let timeArray = ["Year(365)", "Month", "Week", "Day", "Hour", "Minute", "Second", "Millisecond", "Decades", "Centuries"]
    
    let lengthDic = ["Miles": 1609344.0, "Kilometers": 1000000.0, "Meters": 1000.0, "Decimeters":100.0, "Centimeters": 10.0, "Millimeters":1.0, "Feet": 304.8, "Inches": 25.4]
    let weightDic = ["Ton": 907184.74, "Kilogram": 1000, "Pound": 453.59237, "Milligram": 0.001, "Gram": 1.0, "Ounce": 28.34952]
    let areaDic = ["Sq Miles": 4014489600.0, "Sq Kilometers":1550003100.0062, "Hides": 751751503.503007, "Hectares":15500031.000062, "Acres": 6272640.0, "Roods": 1568160.0, "Ares":155000.310001 , "Sq Meters": 1550.0031, "Sq Yards":1296.0, "Sq Feet":144.0, "Sq Centimeters": 0.155,"Sq Inches": 1.0]
    let tempDic = ["Celsius":493.47, "Fahrenheit":460.67, "Kelvin":1.8, "Rankine": 1.0]
    let volumeDic = ["Liter": 202.884163, "Milliliters": 0.202884, "Kiloleters": 202884.136211, "Gallons(US)":768.0, "Quarts(US)":192.0, "Pints(US)":96.0, "Fl Ounce(US)":6.0, "Gallons(Imperial)": 922.329543, "Quarts(Imperial)": 230.582386, "Pints(Imperial)":115.291193, "Fl Ounce(Imperial)": 5.76456, "Cups":48.0, "Tablespoons":3.0, "Centiliters":2.028841, "Teaspoons": 1.0]
    let timeDic = ["Year(365)": 31536000.0, "Month":2628000.0, "Week":604800.0, "Day":86400.0, "Hour": 3600.0, "Minute": 60.0, "Second":1.0, "Millisecond": 0.001, "Decades": 315360000.0, "Centuries":3153600000.0]
    
    
    var unitTitle: String {
        get {
            return _unitTitle
        } set {
            _unitTitle = newValue
        }
    }
  
    init() {
        
    }
    
    
    func setPickerSourseArray() -> [String] {
        if self.unitTitle == "Length" {
            sourceArray = lengthArray
        }
        if self.unitTitle == "Weight" {
            sourceArray = weightArray
        }
        if self.unitTitle == "Area" {
            sourceArray = areaArray
        }
        if self.unitTitle == "Temp" {
            sourceArray = tempArray
        }
        if self.unitTitle == "Volume" {
            sourceArray = volumeArray
        }
        if self.unitTitle == "Time" {
            sourceArray = timeArray
        }
        return sourceArray
    }
    

    
    func calculatedRatio(numerator: String, denominator: String) -> Double {
        if sourceArray == lengthArray {
            Numerator = lengthDic[numerator]
            Denominator = lengthDic[denominator]
        }
        if sourceArray == weightArray {
            Numerator = weightDic[numerator]
            Denominator = weightDic[denominator]
        }
        if sourceArray == areaArray {
            Numerator = areaDic[numerator]
            Denominator = areaDic[denominator]
        }
        if sourceArray == tempArray {
            Numerator = tempDic[numerator]
            Denominator = tempDic[denominator]
        }
        if sourceArray == volumeArray {
            Numerator = volumeDic[numerator]
            Denominator = volumeDic[denominator]
        }
        if sourceArray == timeArray {
            Numerator = timeDic[numerator]
            Denominator = timeDic[denominator]
        }
        if Numerator != nil && Denominator != nil {
            ratio = Numerator / Denominator
        }
        return ratio
    }
    
    func calculation(enteredNumber: Double, ratio: Double) -> Double {
        return enteredNumber * ratio
    }
}


