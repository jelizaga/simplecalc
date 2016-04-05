// Joel Elizaga
// INFO 598 D
// Spring 2016

// A simple CLI calculator written in Swift.

import Foundation

//////////////////
// INTRODUCTION //
//////////////////

print("Welcome to SimpleCalc!")
print("")
print("VALID OPERATORS:")
print("+ - * / %")
print("")
print("OPERATIONS:")
print("count - Counts the number of inputs received.")
print("average - Averages all inputs received.")
print("fact - Calculates the factorial of one input.")
print("")
print("Proceed to calculate:")
print("")

////////////////
// CALCULATOR //
////////////////

// Declaring empty calculation array.
var storage = [UInt]()
// Declaring operand.
var op = ""
// Declaring boolean for a complete calculation.
var complete = false
// Declaring a boolean for a declared operand.
var opDeclared = false
// Declaring a boolean for a declared operation.

// Calculator loop.
while !complete {
    var response = readLine()
    var operand = UInt.init(response!)
    if (response == "+" || response == "-" || response == "*" || response == "/" || response == "%") {
        op = response!
        opDeclared = true
    } else if (response == "count") {
        print(storage.count)
        complete = true
    } else if (response == "average") {
        var total = 0.0
        for num in storage {
            total += Double(num)
        }
        let count = Double(storage.count)
        let result = total / count
        print(result)
        complete = true
    } else if (response == "fact") {
        var result: UInt = 0
        for (var i: UInt = 0; i <= storage.last; i++) {
            result += i
        }
        print(result)
        complete = true
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
        }
    } else {
        print("That's not an integer or an operator.")
    }
}