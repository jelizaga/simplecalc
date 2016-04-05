// Joel Elizaga
// INFO 598 D
// Spring 2016

// A simple CLI calculator written in Swift.

import Foundation

//////////
// HELP //
//////////

func help() {
    
    print("")
    print("=============================================")
    print("")
    print("USEFUL COMMANDS:")
    print("quit - Quits the calculator.")
    print("help - Prints this menu again.")
    print("")
    print("VALID OPERATORS:")
    print("+ - * / %")
    print("")
    print("OPERATIONS:")
    print("count - Counts the number of inputs received.")
    print("average - Averages all inputs received.")
    print("fact - Calculates the factorial of one input.")
    print("")
    print("=============================================")
    print("")
    
}

//////////////////
// INTRODUCTION //
//////////////////

print("Welcome to SimpleCalc!")
help()

////////////////
// CALCULATOR //
////////////////

// Declares that the calculator is on.
var calculatorOn = true

// The calculator loop. Resets calculation data upon completion of a calculation.
while (calculatorOn) {
    
    // Declaring empty calculation array.
    var storage = [UInt]()
    // Declaring stored operator.
    var op = ""
    // Declaring boolean for a complete calculation.
    var complete = false
    // Declaring a boolean for a declared operand.
    var opDeclared = false
    
    print("Calculate:")
    
    // Calculator loop.
    while !complete {
        
        // Receiving and converting user input.
        var response = readLine()
        var operand = UInt.init(response!)
        
        if (response == "+" || response == "-" || response == "*" || response == "/" || response == "%") {
            op = response!
            opDeclared = true
        } else if (response == "count") {
            print(storage.count)
            complete = true
            print("")
            
        } else if (response == "average") {
            var total = 0.0
            for num in storage {
                total += Double(num)
            }
            let count = Double(storage.count)
            let result = total / count
            print(result)
            complete = true
            print("")
        } else if (response == "fact") {
            var result = 0
            for (var i = 0; i <= storage.count; i++) {
                result += i
            }
            print(result)
            complete = true
        } else if (response == "help") {
            help()
        } else if (response == "quit") {
            calculatorOn = false
            print("")
            break
        } else if (operand != nil) {
            storage.append(operand!)
            if (opDeclared) {
                var result: UInt = 0
                if (op == "+") {
                    result = storage.first! + storage.last!
                } else if (op == "-") {
                    result = storage.first! - storage.last!
                } else if (op == "*") {
                    result = storage.first! * storage.last!
                } else if (op == "/") {
                    result = storage.first! / storage.last!
                } else {
                    result = storage.first! % storage.last!
                }
                print(result)
                complete = true
                print("")
            }
        } else {
            print("That's not an integer or an operator.")
        }
        
    }
}