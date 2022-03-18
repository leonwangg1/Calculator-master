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
        
        var no1 = Int(args[0])
        var dummyResult = 0;
        
        for number in stride(from: 0, to: args.count, by: 2) {
//            print("no1: \(args[number])")
//            print("operator:\(args[number+1])")
//            print("no2: \(args[number+2])")
            if (number+2 < args.count){
                if (args.contains(args[number+1])){
                    let no2 = args[number+2]
                    let operations = args[number+1]
//                    print("no1: \(no1)")
//                    print("operator: \(operations)")
//                    print("no2: \(no2)")

                    switch operations {
                    case "+":
                        dummyResult = add(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "-":
                        dummyResult = subtract(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "/":
                        dummyResult = divide(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "%":
                        dummyResult = modulo(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "x":
                        dummyResult = multiply(no1: no1!, no2: Int(no2)!);
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
