//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct GameView: View {
    @State private var equation : Equation = Equation(lower_bound: 0, upper_bound: 2, operation: .addition)
    @State private var answer : String = ""
    @State private var score: Int = 0
    
    @Binding var selectedOperator : Operator
    @Binding var lower_bound: Int
    @Binding var upper_bound: Int
    @Binding var time_limit : Int
    
      enum FocusField: Hashable {
        case field
      }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            
            TimerView(time_limit: $time_limit, score: $score)
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.yellow)
                HStack(alignment: .center){
                    Text("\(equation.term1) \(selectedOperator.symbol) \(equation.term2)  = ")
                        
                    TextField("Answer", text: $answer, onCommit: {
                        if Int(answer) == (equation.evaluate()){
                            equation.generateNewTerms()
                            answer = ""
                            score+=1
                        }
                    }).focused($focusedField, equals: .field).fixedSize()
                }
            }.fixedSize(horizontal: false, vertical: true).padding()
            Spacer()
            ZStack {
                /*RoundedRectangle(cornerRadius: 4)
                    .fill(Color.red)*/
                Label("Score: \(score)", systemImage: "minus.forwardslash.plus")
            }.padding()
        }.onAppear() {
            equation = Equation(lower_bound: lower_bound, upper_bound: upper_bound, operation: selectedOperator)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(selectedOperator: .constant(Operator.addition), lower_bound: .constant(0), upper_bound: .constant(100), time_limit: .constant(20) )
    }
}
