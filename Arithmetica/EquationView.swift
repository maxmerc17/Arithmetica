//
//  EquationView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-07.
//

import SwiftUI

struct EquationView: View {
    @Binding var game : Game
    
    @State private var equation : Equation = Equation(lower_bound: 0, upper_bound: 2, operation: .addition)
    @State private var answer : String = ""
    
      enum FocusField: Hashable {
        case field
      }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.yellow)
            HStack(alignment: .center){
                Text("\(equation.term1) \(game.operation.symbol) \(equation.term2)  = ")
                    
                TextField("Answer", text: $answer, onCommit: {
                    if Int(answer) == (equation.evaluate()){
                        equation.generateNewTerms()
                        answer = ""
                        game.score+=1
                    }
                }).focused($focusedField, equals: .field).fixedSize()
            }
        }.fixedSize(horizontal: false, vertical: true).padding()
        .onAppear() {
            equation = Equation(lower_bound: game.lower_bound, upper_bound: game.upper_bound, operation: game.operation)
        }
    }
}

struct EquationView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        EquationView(game: .constant(game))
    }
}
