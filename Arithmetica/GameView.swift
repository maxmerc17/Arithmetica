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
    @Binding var isPresentingResults : Bool
    
    func onClick() {
        game.score = 0
        isPresentingGame = false
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button(action: onClick ) {
                    Text("Quit").padding().background(.red).foregroundColor(.white)
                }.cornerRadius(45)
            }
            
            TimerView(game: $game, isPresentingGame: $isPresentingGame, isPresentingResults: $isPresentingResults)
            
            ZStack {
                Label("Score: \(game.score)", systemImage: "minus.forwardslash.plus")
            }.padding()
            
            if (game.operation == .division){
                Text("Round answers down to the nearest whole number for division.").padding()
            }
            
            EquationView(game: $game, equation: Equation(lower_bound: game.lower_bound, upper_bound: game.upper_bound, operation: game.operation))
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(data: Game.Data())
        GameView(game: .constant(game), isPresentingGame: .constant(true), isPresentingResults: .constant(false))
    }
}
