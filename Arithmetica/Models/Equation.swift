//
//  Problem.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import Foundation
import Accessibility

struct Equation {
    var term1 : Int
    var term2 : Int
    var upper_bound : Int
    var lower_bound : Int
    var operation : Operator {
        didSet{
            if operation == .division && lower_bound == 0{
                self.lower_bound = 1
            }
        }
    }
    
    init(lower_bound : Int, upper_bound : Int, operation : Operator) {
        // don't want to challege people to divide by zero
        if operation == .division && lower_bound == 0{
            self.lower_bound = 1
        } else {
            self.lower_bound = lower_bound
        }
        
        self.upper_bound = upper_bound
        self.operation = operation
        
        self.term1 = 2
        self.term2 = 1
        let (term1, term2) : (Int, Int) = generateNewTerms()
        self.term1 = term1
        self.term2 = term2
        
    }
    
    mutating func generateNewTerms() -> (Int, Int) {
        switch operation {
            case .addition, .multiplication:
                term1 = Int.random(in: self.lower_bound...upper_bound)
                term2 = Int.random(in: self.lower_bound...upper_bound)
            case .subtraction, .division:
                term1 = Int.random(in: self.lower_bound...upper_bound)
                term2 = Int.random(in: self.lower_bound...term1)
        }
        return (term1, term2)
    }
    
    func evaluate() -> Int{
        switch operation {
            case .addition:
                return term1 + term2
            case .subtraction:
                return term1 - term2
            case .multiplication:
                return term1 * term2
            case .division:
                return term1/term2 //Double(Int((term1 / term2)*10)/10)
        }
    }
}
