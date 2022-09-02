//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct GameView: View {
    @State private var equation : Equation = Equation()
    @State private var answer : String = ""
    @State private var score: Int = 0
    
    @Binding var selectedOperator : Operator
    @Binding var lower_bound: Int
    @Binding var upper_bound: Int
    @Binding var time_limit : Int
    
    @State var timeRemaining : Int = 20
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
      enum FocusField: Hashable {
        case field
      }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
            Spacer()
            
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
                    }).focused($focusedField, equals: .field).fixedSize()
                }
            }.fixedSize(horizontal: false, vertical: true).padding()
            Spacer()
            ZStack {
                /*RoundedRectangle(cornerRadius: 4)
                    .fill(Color.red)*/
                Label("Score: \(score)", systemImage: "minus.forwardslash.plus")
            }.padding()
        }.onAppear() { timeRemaining = time_limit }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    let time_limit : Int = 20
    
    static var previews: some View {
        GameView(selectedOperator: .constant(Operator.addition), lower_bound: .constant(0), upper_bound: .constant(100), time_limit: .constant(20) )
    }
}
