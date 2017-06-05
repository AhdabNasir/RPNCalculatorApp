//
//  CalculatorEngine.swift
//  CalculatorRPN
//
//  Created by Ahdab Nasir on 18/02/2016.
//  Copyright © 2016 Ahdab Nasir. All rights reserved.
//

import Foundation
import UIKit
import Darwin

class CalculatorEngine :NSObject {
    
    var operandStack = Array<Double>()
    
    func updateStackWithValue(value: Double){
      
        self.operandStack.append(value)
        
    }
    
    
    func sindegrees(degrees:Double)->Double{
        
        return sin(degrees * M_PI / 180.0)
    }
    
    func cosdegrees(degrees:Double)->Double{
        
        return cos(degrees * M_PI / 180.0)
    }
    
    func tandegrees(degrees:Double)->Double{
        
        return tan(degrees * M_PI / 180.0)
    }
    
    func asinradian(radian:Double)->Double{
        
        return asin(radian) * (180.0 / M_PI)
    }
    
    func acosradian(radian:Double)->Double{
        
        return acos(radian) * (180.0 / M_PI)
    }
    
    func atanradian(radian:Double)->Double{
        
        return atan(radian) * (180.0 / M_PI)
    }
    
    func operate(operation: String, buttonname: String) ->Double {
        
        switch operation {
            
        case "⨯":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() * self.operandStack.removeLast()
            }
        case "÷":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() / self.operandStack.removeLast()
                
            }
        case "+":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() + self.operandStack.removeLast()
                
            }
        case "−":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() - self.operandStack.removeLast()
                
            }
        case "±":
            return self.operandStack.removeLast() * (-1)
            
            
        case "⨯²":
            let number = self.operandStack.removeLast()
            return number * number
            
            
        case "√":
            return sqrt(self.operandStack.removeLast())
            
            
        case "π":
            let ans = self.operandStack.removeLast() * M_PI
            return round( ans * 100000000 ) / 100000000
            
            
        case "⅟×":
            return 1 / self.operandStack.removeLast()
        
        case "log₁₀":
            return log10(self.operandStack.removeLast())
            
            
        case "logᵉ":
            return log(self.operandStack.removeLast())
            
    
        case "sin":
            if(buttonname == "rad"){
                return sin(self.operandStack.removeLast())
            }
            else {
                return sindegrees(self.operandStack.removeLast())
            }
            
        case "cos":
            if(buttonname == "rad"){
                return cos(self.operandStack.removeLast())
            }
            else {
                return cosdegrees(self.operandStack.removeLast())
            }
            
        case "tan":
            if(buttonname == "rad"){
                return tan(self.operandStack.removeLast())
            }
            else {
                return tandegrees(self.operandStack.removeLast())
            }
            
        case "sin-¹":
            if(buttonname == "rad"){
                return asin(self.operandStack.removeLast())
            }
            else {
                return asinradian(self.operandStack.removeLast())
            }
            
        case "cos-¹":
            if(buttonname == "rad"){
                return acos(self.operandStack.removeLast())
            }
            else {
                return acosradian(self.operandStack.removeLast())
            }
            
        case "tan-¹":
            if(buttonname == "rad"){
                return atan(self.operandStack.removeLast())
            }
            else {
                return atanradian(self.operandStack.removeLast())
            }
            
            
        default:break
        }
        return 0.0
    }
}
