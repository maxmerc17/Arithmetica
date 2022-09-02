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
    var t1_upperBound : Int = 100
    var t1_lowerBound : Int = 1
    var t2_upperBound : Int = 100
    var t2_lowerBound : Int = 1
    
    init() {
        self.term1 = Int.random(in: t1_lowerBound..<t1_upperBound)
        self.term2 = Int.random(in: t2_lowerBound..<t2_upperBound)
    }
    
    mutating func generateNewTerms() -> Void {
        term1 = Int.random(in: t1_lowerBound..<t1_upperBound)
        term1 = Int.random(in: t2_lowerBound..<t2_upperBound)
    }
    
    
    func evaluate(operation function: Operator) -> Int{
        switch function {
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
