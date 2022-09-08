//
//  GameParameters.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-05.
//

import Foundation

struct Game : Identifiable, Codable{
    let id: UUID
    var lower_bound : Int
    var upper_bound : Int
    var time_limit : Int
    var operation : Operator
    var score : Int
    var date : Date
    
    init(id: UUID = UUID(), lower_bound : Int, upper_bound : Int, time_limit : Int, operation : Operator, score: Int){
        self.id = id
        self.lower_bound = lower_bound
        self.upper_bound = upper_bound
        self.time_limit = time_limit
        self.operation = operation
        self.score = score
        self.date = Date.now
    }
}

extension Game{
    struct Data {
        var lower_bound : Int = 0
        var upper_bound : Int = 100
        var time_limit : Int = 20
        var operation : Operator = .addition
        var score : Int = 0
        //var date : Date = Date.now
    }
    
    init(data: Data){
        id = UUID()
        lower_bound = data.lower_bound
        upper_bound = data.upper_bound
        time_limit = data.time_limit
        operation = data.operation
        score = data.score
        date = Date.now
    }
}

