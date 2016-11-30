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
    @IBOutlet weak var leftChosenUnitLbl: UILabel!
    @IBOutlet weak var rightChosenUnitLbl: UILabel!
    @IBOutlet weak var calculatedValue: UILabel!
    @IBOutlet weak var enteredValue: UITextField!
    @IBOutlet weak var ErrorMessageLbl: UILabel!

    var array: [String] = []
    var enterNumber : Double?
    var chosenUnit: String!
    var toBeConvertedUnit: String!
    var convertedNumber: String!
    var ratio: Double!
    
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
        enteredValue.delegate = self

        unitLbl.text = _unitTitle
        converter.unitTitle = _unitTitle
        array = converter.setPickerSourseArray()
        leftChosenUnitLbl.text = array[0]
        chosenUnit = array[0]
        rightChosenUnitLbl.text = array[0]
        toBeConvertedUnit = array[0]
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
            leftChosenUnitLbl.text = array[row]
            chosenUnit = array[row]
        } else {
            rightChosenUnitLbl.text = array[row]
            toBeConvertedUnit = array[row]
        }
        ratio = converter.calculatedRatio(numerator: chosenUnit, denominator: toBeConvertedUnit)
        if enterNumber != nil {
                convertedNumber = converter.calculation(enteredNumber: enterNumber!)
                calculatedValue.text = convertedNumber
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredValue.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = Double(enteredValue.text!) {
            ErrorMessageLbl.isHidden = true
            unitPicker.isUserInteractionEnabled = true
            enterNumber = value
            convertedNumber = converter.calculation(enteredNumber: value)
            calculatedValue.text = convertedNumber
        } else {
            enterNumber = nil
            ErrorMessageLbl.isHidden = false
            unitPicker.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
