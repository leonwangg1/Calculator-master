//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
let operators: [String] = ["+", "-", "/", "%", "x"]
var number: Bool = true
var op: Bool = false

func isStringAnInt(string: String) -> Bool {
    return Int(string) != nil
}

// Retrieve User Input
let no1 = args[0]; // Sample Code Only! Update Required!
let operations = args[1]; // Sample Code Only! Update Required!
let no2 = args[2]; // Sample Code Only! Update Required!

// Check if array has less than 3 elements and return error. Also if doesn't end in number.
if args.count < 3 || args.count%2 == 0{
    print("Invalid input")
    exit(EXIT_FAILURE)
}

for element in args{
    if (operators.contains(String(element)) == false && isStringAnInt(string: String(element)) == false){ // Only int and op
        print("Input has to contain int and operators only")
        exit(EXIT_FAILURE)
        // Exit code
    } else {
        if (isStringAnInt(string: String(element)) && op == false){
            number = false;
            op = true;
        } else if (operators.contains(String(element)) && number == false){
            number = true;
            op = false;
        }
        else {
            print("Invalid input, must be in form [number operator number ... number]")
            exit(EXIT_FAILURE)
            // Exit code
        }
    }
}

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: args);

print(result)
