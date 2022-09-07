//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct GameView: View {
    @Binding var games : [Game]
    @Binding var game : Game
    
    @State private var equation : Equation = Equation(lower_bound: 0, upper_bound: 2, operation: .addition)
    @State private var answer : String = ""
    @State private var score: Int = 0
    
      enum FocusField: Hashable {
        case field
      }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            
            TimerView(games: $games, game: $game)
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.yellow)
                HStack(alignment: .center){
                    Text("\(equation.term1) \(game.operation.symbol) \(equation.term2)  = ")
                        
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
            equation = Equation(lower_bound: game.lower_bound, upper_bound: game.upper_bound, operation: game.operation)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(data: Game.Data())
        GameView(games: .constant([game]), game: .constant(game))
    }
}
