//
//  CalculationModels.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/27/22.
//

import Foundation


class  CalculationModel {
    
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    
    public func setNumber(number: Int) {
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber
    }
    
    public func setOperations(operation: Operations) {
      
        guard let number = Double(currentNumber) else { return }
        firstNumber = number
        currentNumber = ""
        currentOperation = operation
    }
    
    public func getResult() -> String {
       
        guard let number = Double(currentNumber) else { return ""}
        secondNumber = number
        
        switch currentOperation {
        
        case .noAction:
            print("noAction")
            return ""
        case .addition:
            return String(firstNumber + secondNumber)
        case .subtraction:
            return String(firstNumber - secondNumber)
        case .multiplication:
            return String(firstNumber * secondNumber)
        case .division:

            if secondNumber == 0 {
                return "Error"
            } else {
                return String(firstNumber / secondNumber)
            }
        }
    }
    
    public func resetValue() {
        
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
    }
    
    public func invertValue() {
       
        guard let number = Double(currentNumber) else { return }
        
        if number > 0 {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else {
            currentNumber.remove(at: currentNumber.startIndex)
        }
    }
}
