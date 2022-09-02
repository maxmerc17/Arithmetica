//
//  Operator.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import Foundation

enum Operator : String, Equatable, CaseIterable {
    case addition
    case subtraction
    case multiplication
    case division
    
    
    var symbol : String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "x"
        case .division:
            return "/"
        }
    }
    
    var systemImage : String {
        switch self {
        case .addition:
            return "plus"
        case .subtraction:
            return "minus"
        case .multiplication:
            return "multiply"
        case .division:
            return "divide"
        }
    }
    
    
}
