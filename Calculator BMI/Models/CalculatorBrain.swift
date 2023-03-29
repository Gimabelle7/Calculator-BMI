//
//  CalculatorBrain.swift
//  Calculator BMI
//
//  Created by Gimabelle Garcia vasquez on 28/3/23.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getAdvice() -> String{
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
        
    }
    
    func getVMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0 )
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "eat more pies", color: UIColor.blue )
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: " fit as a fiddle", color: UIColor.yellow )
            
        } else {
            bmi = BMI(value: bmiValue, advice: "eat less pies", color: UIColor.magenta)
            
        }
    }
}
