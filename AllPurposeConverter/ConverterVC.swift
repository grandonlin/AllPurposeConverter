//
//  LengthVC.swift
//  AllPurposeConverter
//
//  Created by Grandon Lin on 2016-11-16.
//  Copyright © 2016 Grandon Lin. All rights reserved.
//

import UIKit

class ConverterVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var unitLbl: UILabel!
    @IBOutlet weak var unitPicker: UIPickerView!
    @IBOutlet weak var calculatedValue: UILabel!
    @IBOutlet weak var enteredValueLbl: UILabel!


    var array: [String] = []
    var chosenUnit: String!
    var toBeConvertedUnit: String!
    var leftNumber = "0"
    var enteredNumber: Double!
    var convertedNumber: Double!
    var ratio: Double!
    var inSwitchMode = false
    var storedValue: String!
    
    private var _unitTitle: String!
    
    var unitTitle: String {
        get {
            return _unitTitle
        } set {
            _unitTitle = newValue
        }
    }
    
    var converter = Converter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unitPicker.dataSource = self
        unitPicker.delegate = self

        unitLbl.text = _unitTitle
        converter.unitTitle = _unitTitle
        array = converter.setPickerSourseArray()
        chosenUnit = array[0]
        toBeConvertedUnit = array[0]
        enteredNumber = 0.0
        convertedNumber = 0.0
        ratio = 1.0
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            chosenUnit = array[row]
        } else {
            toBeConvertedUnit = array[row]
        }
        ratio = converter.calculatedRatio(numerator: chosenUnit, denominator: toBeConvertedUnit)
        convertedNumber = converter.calculation(enteredNumber: Double(enteredNumber), ratio: ratio)
        calculatedValue.text = "\(convertedNumber!)"
    }
    
    @IBAction func btnPressed(_ sender: UIButton!) {
        if leftNumber == "0" {
            leftNumber = ""
        }
        leftNumber += "\(sender.currentTitle!)"
        calculation()
    }

    @IBAction func dotBtnPressed(_ sender: UIButton) {
        if leftNumber == "0" {
                leftNumber += "\(sender.currentTitle!)"
                calculation()
        } else {
            if !leftNumber.characters.contains(".") {
                leftNumber += "\(sender.currentTitle!)"
                calculation()
            }
        }
        
    }
        
    @IBAction func backspaceBtnPressed(_ sender: UIButton) {
        if leftNumber != "" {
            leftNumber.characters.removeLast()
            if leftNumber == "" {
                leftNumber = "0"
            }
            calculation()
        }
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ACBtnPressed(_ sender: UIButton) {
        leftNumber = "0"
        calculation()
    }
    
    @IBAction func posNegBtnPressed(_ sender: UIButton) {
        if !leftNumber.characters.contains("-") {
            leftNumber = "-\(leftNumber)"
        } else {
            leftNumber.characters.removeFirst()
        }
        calculation()
    }
    
    @IBAction func switchBtnPressed(_ sender: UIButton) {
        let leftUnit = unitPicker.selectedRow(inComponent: 0)
        let rightUnit = unitPicker.selectedRow(inComponent: 1)
        
        unitPicker.selectRow(rightUnit, inComponent: 0, animated: true)
        unitPicker.selectRow(leftUnit, inComponent: 1, animated: true)
        unitPicker.reloadAllComponents()
        chosenUnit = array[unitPicker.selectedRow(inComponent: 0)]
        toBeConvertedUnit = array[unitPicker.selectedRow(inComponent: 1)]
        calculation()
        
    }
    
    
    func calculation() {
        enteredNumber = Double(leftNumber)
        enteredValueLbl.text = leftNumber
        ratio = converter.calculatedRatio(numerator: chosenUnit, denominator: toBeConvertedUnit)
        convertedNumber = converter.calculation(enteredNumber: enteredNumber, ratio: ratio)
        calculatedValue.text = "\(convertedNumber!)"
    }
}


