//
//  EquationView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-07.
//

import SwiftUI

struct EquationView: View {
    @Binding var game : Game
    
    @State var equation : Equation
    @State var answer : String = ""
    
    @FocusState var fieldInFocus: Bool
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.yellow)
            HStack(alignment: .center){
                Text("\(equation.term1) \(game.operation.symbol) \(equation.term2)  = ")
                    
                TextField("Answer", text: $answer)
                    .onChange(of: answer) {
                        if Int($0) == (equation.evaluate()){
                            let (a,b) = equation.generateNewTerms()
                            print("\(a) \(b)")
                            answer = ""
                            game.score+=1
                        }
                    }
                    .focused($fieldInFocus)
                    .keyboardType(.numberPad)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { fieldInFocus = true }
                    }
            }.foregroundColor(.black)
        }.fixedSize(horizontal: false, vertical: true).padding()
    }
}

struct EquationView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        EquationView(game: .constant(game), equation: Equation(lower_bound: game.lower_bound, upper_bound: game.upper_bound, operation: game.operation))
    }
}
