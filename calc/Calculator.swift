//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    let precedence : [String] = ["x", "/", "%"]
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1/no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func modulo(no1: Int, no2: Int) -> Int {
        return no1%no2;
    }
    
    func calculate(args: [String]) -> String {
        
        var dummyResult = 0;
        var replacedArgs = args // Copy of args array that is mutable

        // Look for MultiplicationPrecedence first (*, /, %)
        while (replacedArgs.contains("x") || replacedArgs.contains("%") || replacedArgs.contains("/")){
            for number in stride(from: 0, to: replacedArgs.count, by: 2) {

                if (number+2 < replacedArgs.count){
                    if (replacedArgs.contains(replacedArgs[number+1]) && replacedArgs.contains(replacedArgs[number+2])){
                        
                        let no1 = replacedArgs[number]
                        let operatorPrecedence = replacedArgs[number+1]
                        let no2 = replacedArgs[number+2]
                            
                        if (precedence.contains(operatorPrecedence)){
                            switch operatorPrecedence {
                            case "/":
                                dummyResult = divide(no1: Int(no1)!, no2: Int(no2)!);
                                replacedArgs.insert(String(dummyResult), at: number)
                            case "%":
                                dummyResult = modulo(no1: Int(no1)!, no2: Int(no2)!);
                                replacedArgs.insert(String(dummyResult), at: number)
                            case "x":
                                dummyResult = multiply(no1: Int(no1)!, no2: Int(no2)!);
                                replacedArgs.insert(String(dummyResult), at: number)
                            default:
                                break
                            }
                        
                            replacedArgs.remove(at: number+1)
                            replacedArgs.remove(at: number+1)
                            replacedArgs.remove(at: number+1)
                            
                            // Check if next operator is preceding operator
                            if(number+1 < replacedArgs.count){
                                if(replacedArgs.contains(replacedArgs[number+1]) && precedence.contains(replacedArgs[number+1])){
                                    break;
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    


        var no1 = Int(replacedArgs[0])

        // Look for AdditionPrecedence first (+, -)
        for number in stride(from: 0, to: replacedArgs.count, by: 2) {
            if (number+2 < replacedArgs.count){
                if (replacedArgs.contains(replacedArgs[number+1]) && replacedArgs.contains(replacedArgs[number+2])){
                    
                    let no2 = replacedArgs[number+2]
                    let operations = replacedArgs[number+1]

                    switch operations {
                    case "+":
                        dummyResult = add(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "-":
                        dummyResult = subtract(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    default:
                        break
                    }
                }
            }
        }
        
        let result = String(dummyResult);
        return(result)
    }
}
