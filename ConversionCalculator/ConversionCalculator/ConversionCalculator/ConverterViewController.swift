//
//  CalculatorViewController.swift
//  ConversionCalculator
//
//  Created by Armaja LaRue-Hill on 12/6/19.
//  Copyright © 2019 Armaja LaRue-Hill. All rights reserved.
//

import Foundation
import UIKit

struct ConverterStruct{
    var label: String
    var input: String
    var output: String
    
    var convert:((_ input:Double)->Double)
}


class ConverterViewController: UIViewController{
    
    @IBOutlet weak var outtextField: UITextField!
    
    @IBOutlet weak var intextField: UITextField!
    
    var inputVal : String!
    var output : String!
    var decimalCheck : Bool!
    var clearCheck : Bool!
    var negativeCheck : Bool!
    
    
    let conversionEquations = [
        ConverterStruct(label: "Farenheit to Celsius", input: " °F", output: " Degree Celsius", convert: {return ($0 - 32.0)*(5.0/9.0)}),
        
        
        ConverterStruct(label: "Celsius to Farenheit", input: " °C", output: " Degree Farenheit", convert: {return ($0 - 9.0/5.0)+32}),
        
        ConverterStruct(label: "Miles to Kilometers", input: " miles", output: " kilometers", convert: {return ($0 * 1.60934)}),
        
        ConverterStruct(label: "Kilometers to Miles", input: " kilometers", output: " miles", convert: {return ($0/1.60934)}),
    ]
    
    var select:ConverterStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        select = conversionEquations[0]
        outtextField.text = select.output
        intextField.text = select.input
        clearMethod(nil)
    }
    
    func outputUpdate(_ input: String){
        if(input == "."){
            decimalCheck = true
            inputVal.append(".0")
        }
        
        else if(decimalCheck && clearCheck){
            inputVal.removeLast()
            inputVal.append(input)
            clearCheck = false
        }
        
        else if(input == "-"){
            if inputVal.hasPrefix("-"){
                negativeCheck = false
            }
            
            else{
                negativeCheck = true
            }
        }
        else { inputVal.append(input) }
    
    
    let convertTemp: Double
    
    
    if(negativeCheck){
        convertTemp = select.convert(-1.0 * Double(inputVal)!)
        intextField.text = inputVal + select.input
        }
    else{
        convertTemp = select.convert(Double(inputVal)!)
        intextField.text = inputVal + select.input
        }
        
        outtextField.text = String(convertTemp) + select.output
    }
    
    
    @IBAction func negative(_ sender: UIButton) {
        outputUpdate("-")
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        outputUpdate(sender.titleLabel!.text!)
    }
    
    @IBAction func clearMethod(_ sender: UIButton?) {
        intextField.text = select.input
        outtextField.text = select.output
        inputVal = ""
        output = ""
        clearCheck = true
        decimalCheck = false
        negativeCheck = false
    }
    
    @IBAction func conversion(_ sender: Any) {
        let alert = UIAlertController(title: "ConversionList", message:"Select a Conversion", preferredStyle: UIAlertController.Style.actionSheet)
        
        for conversion in conversionEquations{
            alert.addAction(UIAlertAction(title: conversion.label, style: .default){
                _ in
                self.select = conversion
                self.clearMethod(nil)
            })
        
        }
    present(alert, animated: true, completion: nil)
    }


}
