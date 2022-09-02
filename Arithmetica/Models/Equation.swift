//
//  Problem.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import Foundation

struct Equation {
    var term1 : Int
    var term2 : Int
    var upper_bound : Int
    var lower_bound : Int
    var operation : Operator
    
    init(lower_bound : Int, upper_bound : Int, operation : Operator) {
        // don't want to challege people to divide by zero
        if operation == .division && lower_bound == 0{
            self.lower_bound = 1
        } else {
            self.lower_bound = lower_bound
        }
        
        self.upper_bound = upper_bound
        self.term1 = Int.random(in: lower_bound..<upper_bound)
        self.term2 = Int.random(in: lower_bound..<upper_bound)
        self.operation = operation
    }
    
    mutating func generateNewTerms() -> Void {
        switch operation {
            case .addition, .multiplication:
                term1 = Int.random(in: self.lower_bound..<upper_bound)
                term2 = Int.random(in: self.lower_bound..<upper_bound)
            case .subtraction, .division:
                term1 = Int.random(in: self.lower_bound+1..<upper_bound)
                term2 = Int.random(in: self.lower_bound..<term1)
        }
    }
    
    func evaluate() -> Int{
        switch operation {
            case .addition:
                return term1 + term2
            case .subtraction:
                return abs(term1 - term2)
            case .multiplication:
                return term1 * term2
            case .division:
                return Int(term1 / term2)
        }
    }
}
