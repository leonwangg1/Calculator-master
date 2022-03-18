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
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        let no1 = args[0]; // Sample Code Only! Update Required!
        let operations = args[1]; // Sample Code Only! Update Required!
        let no2 = args[2]; // Sample Code Only! Update Required!
        var dummyResult = 0;
        
        switch operations {
        case "+":
            dummyResult = add(no1: Int(no1)!, no2: Int(no2)!);
        case "-":
            dummyResult = subtract(no1: Int(no1)!, no2: Int(no2)!);
        case "/":
            dummyResult = divide(no1: Int(no1)!, no2: Int(no2)!);
        case "%":
            dummyResult = modulo(no1: Int(no1)!, no2: Int(no2)!);
        case "x":
            dummyResult = multiply(no1: Int(no1)!, no2: Int(no2)!);
        default:
            break
        }
        
        let result = String(dummyResult);
        return(result)
    }
    
}
