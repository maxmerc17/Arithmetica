//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct Game: View {
    @State private var equation : Equation = Equation()
    @State private var answer : String = ""
    @State private var score: Int = 0
    @State private var selectedOperator : Operator = .addition
    @State private var lowerBound1: String = "1"
    @State private var upperBound1: String = "100"
    @State private var lowerBound2: String = "1"
    @State private var upperBound2: String = "100"
    
    var body: some View {
        NavigationView{
            VStack {
                    
                HStack{
                    VStack(alignment: .center){
                        Text("Term 1")
                        TextField("Lower bound", text: $lowerBound1, onCommit: {equation.t1_lowerBound = Int(lowerBound1) ?? 1})
                        TextField("Upper bound", text: $upperBound1, onCommit: {equation.t1_upperBound = Int(upperBound1) ?? 100})
                    }
                    VStack(alignment: .center){
                        Text("Term 2")
                        TextField("Lower bound", text: $lowerBound2, onCommit: {equation.t2_lowerBound = Int(lowerBound2) ?? 1})
                        TextField("Upper bound", text: $upperBound2, onCommit: {equation.t2_upperBound = Int(upperBound2) ?? 100})
                    }
                }
                
                HStack(){
                    Text("Select operation")
                    Picker("Operator", selection: $selectedOperator) {
                        ForEach(Operator.allCases, id: \.self) { value in Text(value.symbol).tag(value)
                        }
                    }
                }
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.red)
                    Text("Score: \(score)")
                }.fixedSize(horizontal: false, vertical: true)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.yellow)
                    HStack(alignment: .center){
                        Text("\(equation.term1) \(selectedOperator.symbol) \(equation.term2)  = ")
                            
                        TextField("Answer", text: $answer, onCommit: {
                            if Int(answer) == (equation.evaluate(operation: selectedOperator)){
                                equation.generateNewTerms()
                                answer = ""
                                score+=1
                            }
                        }).fixedSize()
                    }
                }.fixedSize(horizontal: false, vertical: true)
                Spacer()
            }.navigationBarTitle(Text("Arithmetica")).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
