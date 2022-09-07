//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct GameView: View {
    @Binding var game : Game
    @Binding var isPresentingGame : Bool
    
    @State private var equation : Equation = Equation(lower_bound: 0, upper_bound: 2, operation: .addition)
    @State private var answer : String = ""
    
      enum FocusField: Hashable {
        case field
      }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            
            TimerView(game: $game, isPresentingGame: $isPresentingGame)
            
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
            Spacer()
            ZStack {
                /*RoundedRectangle(cornerRadius: 4)
                    .fill(Color.red)*/
                Label("Score: \(game.score)", systemImage: "minus.forwardslash.plus")
            }.padding()
        }.onAppear() {
            equation = Equation(lower_bound: game.lower_bound, upper_bound: game.upper_bound, operation: game.operation)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(data: Game.Data())
        GameView(game: .constant(game), isPresentingGame: .constant(true))
    }
}
